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
    
    static var db: Firestore = buildFirestore(emulator: emulator)
    
    static private func buildFirebaseAuth(emulator: Bool = false) -> Auth {
        let auth = Auth.auth()
        if emulator {
            auth.useEmulator(withHost: "localhost", port: 9099)
        }
        return auth
    }
    
    static private func buildFirestore(emulator: Bool = false) -> Firestore {
        let db = Firestore.firestore()
        if emulator {
            db.useEmulator(withHost: "localhost", port: 8080)
        }
        return db
    }
    
    static func getAuthRepo() -> AuthRepo {
        return AuthFirebaseDataSource(auth: RepoFactory.auth)
    }
    
    static func getUserRepo() -> UserRepo {
        return UserRepo(db: db)
    }
}
