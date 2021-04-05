//
//  AuthFirebaseDataSource.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Combine
import FirebaseAuth

enum AuthError: Error {
    case error
}

class AuthFirebaseDataSource: AuthRepo {
    
    
    let auth: Auth
    
    private static let TAG = "AuthFirebaseDataSource"
    
    init(auth: Auth) {
        self.auth = auth
    }
    
    func login(email: String, password: String) -> AnyPublisher<String, Error> {
        print("AuthFirebaseDataSource login executed")
        return Future { promise in
            self.auth.signIn(withEmail: email, password: password, completion: { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    return promise(.failure(AuthError.error))
                }
                
                promise(.success(user.uid))
            })
        }.eraseToAnyPublisher()
    }
    
    func signup(email: String, password: String) -> AnyPublisher<String, Error> {
        print("AuthFirebaseDataSource signup executed")
        return Future { promise in
            self.auth.createUser(withEmail: email, password: password, completion: {authResult, error in
                guard let user = authResult?.user, error == nil else {
                    print("\(AuthFirebaseDataSource.TAG) \(String(describing: error?.localizedDescription))")
                    return promise(.failure(error!))
                }
                print("\(AuthFirebaseDataSource.TAG) \(user.uid)")
                return promise(.success(user.uid as String))
            })
        }.eraseToAnyPublisher()
    }
    
    func logout() -> AnyPublisher<Void, Error> {
        return Future { promise in
            do {
                try self.auth.signOut()
                promise(.success(()))
            }
            catch(let error) {
                print("logout unsuccessfull")
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func delete() -> AnyPublisher<Void, Error> {
        return Future { promise in
            guard let user = self.auth.currentUser else {
                return promise(.failure(AuthError.error))
            }
            user.delete { error in
                if let error = error {
                    return promise(.failure(error))
                } else {
                    return promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func observeAuthState() -> CurrentValueSubject<String?, Never> {
        let authSubject = CurrentValueSubject<String?, Never>(nil)
        let handle = self.auth.addStateDidChangeListener({auth, user in
            print("AUTH STATE CHANGED \(user)")
            if let user = user {
                authSubject.send(user.uid)
            } else {
                authSubject.send(nil)
            }
        })
        _ = authSubject.handleEvents(receiveCancel: {
            self.auth.removeStateDidChangeListener(handle)
        })
        return authSubject
    }
    
    
}
