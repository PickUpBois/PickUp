//
//  SignUpUI.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/7/21.
//

import SwiftUI
import Combine

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var viewModel = ViewModel()
    @EnvironmentObject var router: ContentView.ViewModel
    @Environment(\.presentationMode) var presentation
    
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
                TextField("First Name", text: $viewModel.firstName)
            }
            //First Name Text Field Settings
            .padding(.all, 20.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            HStack {
                //Hstack Email
                TextField("Last Name", text: $viewModel.lastName)
            }
            //Last Name Text Field Settings
            .padding(.all, 20.0)
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
            
            //Sign up Button Settings
            Button(action: viewModel.signup){
                Text("Sign up")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    }.frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(9)
                    .padding(.horizontal, 20)
            
            //Login Button Settings
            Button(action: {self.presentation.wrappedValue.dismiss()}) {
                Text("Already have an account? Log in.")
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
    
extension SignUpView {
    class ViewModel: ObservableObject {
        @Published var email = ""
        @Published var password = ""
        @Published var firstName = ""
        @Published var lastName = ""
        @Published var loginError = false
        @Published var loginSuccess = false
        @Published var loading = false
        var cancellables = Set<AnyCancellable>()
        var authRepo: AuthRepo!
        
        init(authRepo: AuthRepo = ViewModelFactory().getAuthRepo()) {
            self.authRepo = authRepo
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
