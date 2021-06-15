//
//  Services.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Apollo
import FirebaseStorage
import FirebaseAuth

class Services {
    
    static let emulator: Bool = true
    
    static var auth: Auth = buildFirebaseAuth(emulator: emulator)
    
    static private func buildFirebaseAuth(emulator: Bool = false) -> Auth {
        let auth = Auth.auth()
        if emulator {
            auth.useEmulator(withHost: "localhost", port: 9099)
        }
        return auth
    }
    
    
    
    static let shared = Services()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)
    private(set) lazy var auth = AuthService(auth: Services.auth)
    private(set) lazy var storage = StorageService(storage: Storage.storage())
    private(set) lazy var rest = RestService()
}
