//
//  SignUpUI.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/7/21.
//

import SwiftUI
import Combine

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    init(viewModel: SignUpViewModel = SignUpViewModel()) {
        self.viewModel = viewModel
    }
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack (spacing: 5) {
            //Logo Image at Top
            Image("logo")
                .resizable()
                .padding(.top, 100.0)
                .frame(width: 240, height: 180)
                .scaledToFit()
            
            Spacer().frame(height: 20)
            
            HStack {
                //Hstack Email
                TextField("First Name", text: $viewModel.firstName)
            }
            //First Name Text Field Settings
            .frame(width: 350)
            .padding(.all, 15.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            
            HStack {
                //Hstack Email
                TextField("Last Name", text: $viewModel.lastName)
            }
            //Last Name Text Field Settings
            .frame(width: 350)
            .padding(.all, 15.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            HStack {
                //Hstack Email
                TextField("Username", text: $viewModel.username)
            }
            //Username Text Field Settings
            .frame(width: 350)
            .padding(.all, 15.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            
            HStack {
                //Hstack Email
                Image(systemName: "envelope")
                    .foregroundColor(.black)
                TextField("Email", text: $viewModel.email)
            }
            //Email Text Field Settings
            .frame(width: 350)
            .padding(.all, 15.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            HStack {
                //Hstack Password
                Image(systemName: "lock")
                    .foregroundColor(.black)
//                TextField("Password", text: $viewModel.password)
                SecureField("Password", text: $viewModel.password)
            }
            //Password Text Field Settings
            .frame(width: 350)
            .padding(.all, 15)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            //Sign up Button Settings
            Button(action: viewModel.signup){
                Text("Sign up")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 380)
                    }
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
            
            //Login Button Settings
            Button(action: {self.presentation.wrappedValue.dismiss()}) {
                Text("Already have an account? Log in.")
                    .foregroundColor(Color("Text"))
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: /*@START_MENU_TOKEN@*/500.0/*@END_MENU_TOKEN@*/, height: 100.0)
            }.frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .cornerRadius(9)
            .padding(.horizontal, 20)
        }
        Spacer()
    }
}
    
extension SignUpView {
    class ViewModel: ObservableObject {
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
            Services.shared.apollo.perform(mutation: CreateUserMutation(createUserInput: CreateUserInput(id: id, username: username, firstName: firstName, lastName: lastName))) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0].localizedDescription)
                        return
                    }
                    self.appState.authId = id
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
