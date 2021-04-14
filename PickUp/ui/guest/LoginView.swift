//
//  LoginUIView.swift
//  PickUp
//
//  Created by David Reynolds on 4/4/21.
//

import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack (spacing: 5) {
            //Logo Image at Top
            Image("Logo")
                .resizable()
                .padding(.top, 100.0)
                .frame(width: 275, height: 200)
                .scaledToFit()
            Spacer()
            
            HStack {
                //Hstack Email
                Image(systemName: "envelope")
                    .foregroundColor(.black)
                TextField("Email", text: $viewModel.email)
            }
            //Email Text Field Settings
            .padding(.all, 20.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            HStack {
                //Hstack Password
                Image(systemName: "lock")
                    .foregroundColor(.black)
                TextField("Password", text: $viewModel.password)
            }
            //Password Text Field Settings
            .padding(.all, 20)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            //Login Button Settings
            Button(action: viewModel.login){
                Text("Login")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    }.frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(9)
                    .padding(.horizontal, 20)
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(Color.red)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 20)
            }
            //Forgot Password Button Settings
            Button(action: {}){
                Text("Forgot Password?")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    }.frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .cornerRadius(9)
                    .padding(.horizontal, 20)
                Spacer()
                .frame(minHeight: 70, maxHeight: 190)
            
            //Sign Up Button Settings
            NavigationLink(destination: SignUpView()) {
                Text("Don't have an account? Sign Up.")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: /*@START_MENU_TOKEN@*/500.0/*@END_MENU_TOKEN@*/, height: 100.0)
            }.frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .cornerRadius(9)
            .padding(.horizontal, 20)
        }
    }
}

extension LoginView {
    class ViewModel: ObservableObject {
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var errorMessage: String = ""
        @Published var loading = false
        var cancellables = Set<AnyCancellable>()
        var authRepo: AuthRepo!
        
        init(authRepo: AuthRepo = RepoFactory().getAuthRepo()) {
            self.authRepo = authRepo
        }
        
        /**
         Function that calls the AuthRepo to login the user using the provided email and password.
         Also provides proper error handling if the AuthRepo emits an error.
         */
        func login() {
            self.errorMessage = ""
            self.loading = false
            self.authRepo.login(email: email, password: password)
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
                        ()
                    }
                }, receiveValue: {userId in
                    ()
                }).store(in: &self.cancellables)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        //LoginUIView().previewDevice("iPhone 8")
        //LoginUIView().previewDevice("iPhone XR")
        //LoginUIView().previewDevice("iPhone 11")
        LoginView().previewDevice("iPhone 12 Pro Max")
            
            
        }
    }
}