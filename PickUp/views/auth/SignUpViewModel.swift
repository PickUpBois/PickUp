//
//  SignUpViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine
import FirebaseMessaging

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var errorMessage: String = ""
    @Published var loginSuccess = false
    @Published var loading = false
    var cancellables = Set<AnyCancellable>()
    var appState: AppState = AppState.shared
    
    // might be buggy since user is not immediately created even when user signs up
    func signup() {
        Services.shared.auth.signup(email: email, password: password)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error) where error as! AuthError == AuthError.emailAlreadyInUse:
                    self.errorMessage = "Email is already in use"
                case .failure(let error) where error as! AuthError == AuthError.invalidEmail:
                    self.errorMessage = "Email is invalid or malformed"
                case .failure(let error) where error as! AuthError == AuthError.weakPassword:
                    self.errorMessage = "Password must be greater than 6 characters."
                case .failure(_):
                    self.errorMessage = "Error occurred"
                case .finished:
                    print("SignUpViewModel SUCCESS")
                }
            }, receiveValue: {uid in
                self.createUser(id: uid)
            }).store(in: &cancellables)
    }
    
    func createUser(id: String) {
        Services.shared.apollo.perform(mutation: CreateUserMutation(input: CreateUserInput(college: nil, firstName: firstName, lastName: lastName, username: username))) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                self.appState.authId = id
                self.putDeviceToken(id: id)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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

class MockSignUpViewModel: SignUpViewModel {
    override func signup() {
        return
    }
    
    override func createUser(id: String) {
        return
    }
}
