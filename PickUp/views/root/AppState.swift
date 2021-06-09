//
//  AppState.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine

class AppState: ObservableObject {
    static let shared: AppState = AppState()
    var authHandle: AnyCancellable? = nil
    @Published var authId: String? = nil
    func listen() {
        self.authHandle = Services.shared.auth.observeAuthState().sink(receiveValue: { id in
            self.authId = id
        })
    }
    
    
    
    func detach() {
        self.authHandle?.cancel()
        self.authHandle = nil
    }
}

class MockAppState: AppState {
    override func listen() {
        return
    }
    
    override func detach() {
        return
    }
}
