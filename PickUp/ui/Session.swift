//
//  Session.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/5/21.
//

import Foundation
import Combine
class Session: ObservableObject  {
    private var authRepo: AuthRepo!
    @Published var authUser: String? = nil
    var authHandle: AnyCancellable!
    
    init(authRepo: AuthRepo = ViewModelFactory().getAuthRepo()) {
        self.authRepo = authRepo
    }
    
    func listen() {
        self.authHandle = authRepo.observeAuthState().sink(receiveValue: {userId in
            self.objectWillChange.send()
            self.authUser = userId
        })
    }
    
    func detach() {
        self.authHandle.cancel()
    }
}
