//
//  ViewModelFactory.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Firebase

class RepoFactory {
    static let emulator: Bool = false
    
    static var auth: Auth = buildFirebaseAuth(emulator: emulator)
    
    static private func buildFirebaseAuth(emulator: Bool = false) -> Auth {
        let auth = Auth.auth()
        if emulator {
            auth.useEmulator(withHost: "localhost", port: 9099)
        }
        return auth
    }
    
    static func getAuthRepo() -> AuthRepo {
        return AuthFirebaseDataSource(auth: RepoFactory.auth)
    }
}
