//
//  SignUpView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/3/21.
//

import SwiftUI
import Combine

struct SignUpView: View {
    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var router: ContentView.ViewModel
    init(viewModel: ViewModel = ViewModelFactory().getSignUpViewModel()) {
        self.viewModel = viewModel
    }
    

    var body: some View {
        if (viewModel.loading) {
            Text("Loading!")
        } else {
            Form {
                TextField("Email address", text: $viewModel.email)
                TextField("Password", text: $viewModel.password)
                Button("Sign up", action: viewModel.signup)
            }
        }
    }
}

extension SignUpView {
    class ViewModel: ObservableObject {
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var success: Bool = false
        @Published var loading: Bool = false
        private var cancellables = Set<AnyCancellable>()
        var authRepo: AuthRepo!
        
        init(repo: AuthRepo = ViewModelFactory().getAuthRepo()) {
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
                }).store(in: &cancellables)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
