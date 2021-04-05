//
//  SignUpView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/3/21.
//

import SwiftUI
import OSLog

struct SignUpView: View {
    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject var router: ContentView.ViewModel
    init(viewModel: ViewModel = ViewModelFactory().getSignUpViewModel()) {
        self.viewModel = viewModel
    }
    

    var body: some View {
        if (viewModel.success) {
            router.currentPage = .home
        }
        print("SignUpView init")
        return NavigationView {
            Form {
                TextField("Email address", text: $viewModel.email)
                TextField("Password", text: $viewModel.password)
                Button("Sign up", action: viewModel.signup)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
