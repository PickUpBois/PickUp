//
//  AuthFirebaseDataSource.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Combine
import FirebaseAuth

/**
 Transforms Firebase Error codes into error codes that are useful for the UI.
 
 - Parameters:
    - error: nullable error object that represents a Firebase NSError
 
 - Returns:
    - An AuthError enum that matches the Firebase Error code
 */
private func transformFirebaseErrorCode(error: Error?) -> AuthError {
    guard let nsError = error as NSError? else {
        return AuthError.error
    }
    guard let errorCode = AuthErrorCode(rawValue: nsError.code) else {
        return AuthError.error
    }
    switch errorCode {
    case .wrongPassword:
        return AuthError.invalidPassword
    case .invalidEmail:
        return AuthError.invalidEmail
    case .userDisabled:
        return AuthError.userDisabled
    case .operationNotAllowed:
        return AuthError.notEnabled
    case .emailAlreadyInUse:
        return AuthError.emailAlreadyInUse
    case .weakPassword:
        return AuthError.weakPassword
    case .requiresRecentLogin:
        return AuthError.requiresRecentLogin
    case .tooManyRequests:
        return AuthError.tooManyRequests
    default:
        return AuthError.error
    }
}

class AuthFirebaseDataSource: AuthRepo {
    
    /// FIRAuth instance
    let auth: Auth
    
    private static let TAG = "AuthFirebaseDataSource"
    
    /**
     Initializes a new AuthFirebaseDataSource with an Authentication instance of Firebase
     
     - Parameters:
        - auth:  representing an FIRAuth instance for managing authentication
     
     - Returns:
        - An initialized AuthFirebaseDataSource instance
     */
    init(auth: Auth = RepoFactory.auth) {
        self.auth = auth
    }
    
    
    func sendVerificationEmail() -> AnyPublisher<Void, AuthError> {
        return Future<Void, AuthError> { promise in
            guard let user = self.auth.currentUser else {
                return promise(.failure(AuthError.error))
            }
            user.sendEmailVerification(completion: { error in
                if error != nil {
                    return promise(.failure(transformFirebaseErrorCode(error: error)))
                } else {
                    return promise(.success(()))
                }
            })
        }.eraseToAnyPublisher()
    }
    
    func login(email: String, password: String) -> AnyPublisher<String, AuthError> {
        print("AuthFirebaseDataSource login executed")
        return Future<String, AuthError> { promise in
            self.auth.signIn(withEmail: email, password: password, completion: { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    return promise(.failure(transformFirebaseErrorCode(error: error)))
                }
                
                promise(.success(user.uid))
            })
        }.eraseToAnyPublisher()
    }
    
    func signup(email: String, password: String) -> AnyPublisher<String, AuthError> {
        print("AuthFirebaseDataSource signup executed")
        return Future<String, AuthError> { promise in
            self.auth.createUser(withEmail: email, password: password, completion: {authResult, error in
                guard let user = authResult?.user, error == nil else {
                    print("\(AuthFirebaseDataSource.TAG) \(String(describing: error?.localizedDescription))")
                    return promise(.failure(transformFirebaseErrorCode(error: error)))
                }
                print("\(AuthFirebaseDataSource.TAG) \(user.uid)")
                return promise(.success(user.uid as String))
            })
        }
        .flatMap { userId in
            return self.sendVerificationEmail()
                .flatMap { _ in
                    return Just(userId)
                }.eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
    func logout() -> AnyPublisher<Void, AuthError> {
        return Future<Void, AuthError> { promise in
            do {
                try self.auth.signOut()
                promise(.success(()))
            }
            catch(let error) {
                print("logout unsuccessfull")
                promise(.failure(transformFirebaseErrorCode(error: error)))
            }
        }.eraseToAnyPublisher()
    }
    
    func delete() -> AnyPublisher<Void, AuthError> {
        return Future<Void, AuthError> { promise in
            guard let user = self.auth.currentUser else {
                return promise(.failure(AuthError.error))
            }
            user.delete { error in
                if let error = error {
                    return promise(.failure(transformFirebaseErrorCode(error: error)))
                } else {
                    return promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func observeAuthState() -> CurrentValueSubject<String?, Never> {
        var userId: String? = nil
        if self.auth.currentUser != nil {
            userId = self.auth.currentUser?.uid
        }
        let authSubject = CurrentValueSubject<String?, Never>(userId)
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
