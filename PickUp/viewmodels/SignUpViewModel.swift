//
//  SignUpViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Combine
extension SignUpView {
    class ViewModel: ObservableObject {
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var success: Bool = false
        private var cancellables = Set<AnyCancellable>()
        var authRepo: AuthRepo!
        
        init(repo: AuthRepo) {
            print("signup viewmodel init")
            self.authRepo = repo
        }
        
        func signup() {
            print("Sign up executed")
            self.authRepo.signup(email: email, password: password)
                .sink(receiveCompletion: {completion in
                    switch completion {
                    case .failure(let error):
                        print("SignUpViewModel \(error.localizedDescription)")
                    case .finished:
                        print("SignUpViewModel SUCCESS")
                    }
                }, receiveValue: {uid in
                    print("SUCCESS: \(uid)")
                    self.success = true
                }).store(in: &cancellables)
        }
    }
}
