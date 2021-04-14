//
//  AuthRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/3/21.
//

import Foundation
import Combine

// Enum of possible error cases for authentication operations
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
    /// Any other error that may have occurred with authentication
    case error
}

protocol AuthRepo {
    
    /**
     Logs in the user using a provided email and password
     
     - Parameters:
        - email: String representing the user's email. Must be a valid email.
        - password: String representing the user's password. Must be greater than 6 characters.
     
     - Throws:
        - `AuthError.invalidPassword` if user's password is invalid
        - `AuthError.userDisabled` if user's account is disabled
        - `AuthError.invalidEmail` if the user's email is malformed
        - `AuthError.notEnabled` if signing in with an email or password is not enabled
        - `AuthError.tooManyRequests` if the user's account is receiving too many requests within a short timeframe
        
     - Returns:
        - AnyPublisher that emits a String containing the auth ID of the user, or an AuthError
     */
    func login(email: String, password: String) -> AnyPublisher<String, AuthError>
    
    func signup(email: String, password: String) -> AnyPublisher<String, AuthError>
    
    func sendVerificationEmail() -> AnyPublisher<Void, AuthError>
    
    func logout() -> AnyPublisher<Void, AuthError>
    
    func delete() -> AnyPublisher<Void, AuthError>
    
    func observeAuthState() -> CurrentValueSubject<String?, Never>
}
