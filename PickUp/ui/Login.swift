//
//  LoginView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/5/21.
//

import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = ViewModelFactory().getLoginViewModel()) {
        self.viewModel = viewModel
    }
    var body: some View {
        Form {
            TextField("Email address", text: $viewModel.email)
            TextField("Password", text: $viewModel.password)
            Button("Login", action: viewModel.login)
        }
    }
}

extension LoginView {
    class ViewModel: ObservableObject {
        @Published var email = ""
        @Published var password = ""
        @Published var loginError = false
        @Published var loginSuccess = false
        var cancellables = Set<AnyCancellable>()
        var authRepo: AuthRepo!
        
        init(authRepo: AuthRepo = ViewModelFactory().getAuthRepo()) {
            self.authRepo = authRepo
        }
        
        func login() {
            self.authRepo.login(email: email, password: password)
                .sink(receiveCompletion: {completion in
                    switch completion {
                    case .failure(let error):
                        self.loginError = true
                    case .finished:
                        self.loginSuccess = true
                    }
                }, receiveValue: {userId in
                    ()
                }).store(in: &self.cancellables)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
