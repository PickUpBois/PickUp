//
//  LoginViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine
import FirebaseMessaging

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var loading = false
    var cancellables = Set<AnyCancellable>()
    var appState: AppState = AppState.shared
    
    /**
     Function that calls the AuthRepo to login the user using the provided email and password.
     Also provides proper error handling if the AuthRepo emits an error.
     */
    func login() {
        self.errorMessage = ""
        self.loading = false
        Services.shared.auth.login(email: email, password: password)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error) where error == AuthError.invalidEmail:
                    self.errorMessage = "Invalid email"
                case .failure(let error) where error == AuthError.invalidPassword:
                    self.errorMessage = "Invalid password"
                case .failure(let error) where error ==
                    AuthError.userDisabled:
                    self.errorMessage = "Account is disabled"
                case .failure(let error) where error ==
                    AuthError.notEnabled:
                    self.errorMessage = "Account not enabled"
                case .failure(let error) where error ==
                        AuthError.tooManyRequests:
                    self.errorMessage = "Account is disabled due to receiving too many requests"
                case .failure(_):
                    self.errorMessage = "Error occurred"
                case .finished:
                    print("login success")
                }
            }, receiveValue: {userId in
                self.appState.authId = userId
                self.putDeviceToken(id: userId)
            }).store(in: &self.cancellables)
    }
    
    func putDeviceToken(id: String) {
        Messaging.messaging().token(completion: {token, error in
            if let error = error {
                return print("unable to get token: \(error.localizedDescription)")
            }
            if let token = token {
                Services.shared.apollo.perform(mutation: PutDeviceTokenMutation(token: token)) { response in
                    switch response {
                    case .success(let result):
                        if let errors = result.errors {
                            print("unable to get token: \(errors[0].localizedDescription)")
                        }
                        
                    case .failure(let error):
                        return print("unable to get token: \(error.localizedDescription)")
                    }
                }
            }
        })
    }
}

class MockLoginViewModel: LoginViewModel {
    override func login() {
        return
    }
}
