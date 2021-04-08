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
    
    static var auth: Auth = buildFirebaseAuth(emulator: emulator)
    
    static private func buildFirebaseAuth(emulator: Bool = false) -> Auth {
        let auth = Auth.auth()
        if emulator {
            auth.useEmulator(withHost: "localhost", port: 9099)
        }
        return auth
    }
    
    func getAuthRepo() -> AuthRepo {
        return AuthFirebaseDataSource(auth: ViewModelFactory.auth)
    }
    
    func getSignUpViewModel() -> SignUpView.ViewModel {
        return SignUpView.ViewModel()
    }
    
    func getContentViewModel() -> ContentView.ViewModel {
        return ContentView.ViewModel(authRepo: getAuthRepo())
    }
    
    func getAuthHomeViewModel() -> AuthHomeView.ViewModel {
        return AuthHomeView.ViewModel(authRepo: getAuthRepo())
    }
    
    func getLoginViewModel() -> LoginView.ViewModel {
        return LoginView.ViewModel(authRepo: getAuthRepo())
    }
}
