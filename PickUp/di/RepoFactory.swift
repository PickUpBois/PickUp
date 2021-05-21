//
//  ViewModelFactory.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Firebase

class RepoFactory {
    static let emulator: Bool = true
    
    static var auth: Auth = buildFirebaseAuth(emulator: emulator)
    
    
    static var LOCAL_URL = "http://localhost:5001/pickup-774f9/us-central/api/"
    
    static var TARGET_URL = LOCAL_URL
    
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
    
    static func getUserRepo() -> IUserRepo {
        return UserApolloRepo()
    }
    
    static func getEventRepo() -> IEventRepo {
        return EventApolloRepo()
    }
}
