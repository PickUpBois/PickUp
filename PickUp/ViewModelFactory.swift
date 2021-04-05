//
//  ViewModelFactory.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Firebase

class ViewModelFactory: ObservableObject {
    static let emulator: Bool = false
    
    static var auth: Auth {
        let fbAuth = Auth.auth()
        if (emulator) {
            fbAuth.useEmulator(withHost: "localhost", port: 9099)
        }
        return fbAuth
    }
    
    private func buildFirebaseAuth(emulator: Bool = false) -> Auth {
        let auth = Auth.auth()
        if emulator {
            auth.useEmulator(withHost: "localhostt", port: 9099)
        }
        return auth
    }
    
    func getSignUpViewModel() -> SignUpView.ViewModel {
        let authRepo = AuthFirebaseDataSource(auth: ViewModelFactory.auth)
        return SignUpView.ViewModel(repo: authRepo)
    }
    
}
