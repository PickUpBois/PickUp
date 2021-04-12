//
//  AuthRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/3/21.
//

import Foundation
import Combine

enum AuthError: Error {
    case error
    case invalidPassword
    case invalidEmail
    case userDisabled
    case notEnabled
    case emailAlreadyInUse
    case weakPassword
    case requiresRecentLogin
    case tooManyRequests
}

protocol AuthRepo {
    
    func login(email: String, password: String) -> AnyPublisher<String, AuthError>
    
    func signup(email: String, password: String) -> AnyPublisher<String, AuthError>
    
    func sendVerificationEmail() -> AnyPublisher<Void, AuthError>
    
    func logout() -> AnyPublisher<Void, AuthError>
    
    func delete() -> AnyPublisher<Void, AuthError>
    
    func observeAuthState() -> CurrentValueSubject<String?, Never>
}
