//
//  AuthService.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseMessaging

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

enum AuthError: Error {
    /// The user's password is invalid
    case invalidPassword
    /// The user's email is invalid or malformed
    case invalidEmail
    /// The user's account is disabled, either from making too many requests or some other cause
    case userDisabled
    /// The authentication method the user used is not enabled
    case notEnabled
    /// The user's email is already being used by a different account
    case emailAlreadyInUse
    /// The user's password is too weak. Specifically, it is shorter than six characters
    case weakPassword
    /// The action the user is performing requires the user to have recently explicitly logged in using some authentication method
    case requiresRecentLogin
    /// The user is performing too many requests on their account in a short period of time
    case tooManyRequests
    /// Unable to extract the device's currernt registration token
    case unableToGetDeviceToken
    /// Any other error that may have occurred with authentication
    case error
}

class AuthService {
    let auth: Auth
    
    init(auth: Auth) {
        self.auth = auth
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
    
    func sendVerificationEmail() -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
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
    
    func signup(email: String, password: String) -> AnyPublisher<String, Error> {
        print("AuthFirebaseDataSource signup executed")
        return Future<String, Error> { promise in
            self.auth.createUser(withEmail: email, password: password, completion: {authResult, error in
                guard let user = authResult?.user, error == nil else {
                    return promise(.failure(transformFirebaseErrorCode(error: error)))
                }
                return promise(.success(user.uid as String))
            })
        }
        .eraseToAnyPublisher()
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
        var currUser: String? = nil
        if self.auth.currentUser != nil {
            currUser = self.auth.currentUser?.uid
        }
        let authSubject = CurrentValueSubject<String?, Never>(currUser)
        let handle = self.auth.addStateDidChangeListener({auth, user in
            print("AUTH STATE CHANGED \(String(describing: user))")
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
    
    func getCurrentUser() -> String? {
        let userId = auth.currentUser?.uid
        return userId
    }
}
