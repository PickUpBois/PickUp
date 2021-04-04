//
//  SignUpViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var success: Bool = false
    
    func signup() {
        print("Sign up executed")
        success = true
    }
}
