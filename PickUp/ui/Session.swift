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
    var cancellables = Set<AnyCancellable>()
    
    init(authRepo: AuthRepo = ViewModelFactory().getAuthRepo()) {
        self.authRepo = authRepo
    }
    
    func listen() {
        self.authHandle = authRepo.observeAuthState().sink(receiveValue: {userId in
            self.objectWillChange.send()
            self.authUser = userId
        })
    }
    
    func signup(email: String, password: String, completionHandler: @escaping (AuthError?) -> Void) {
        print("Sign up executed")
        self.authRepo.signup(email: email, password: password)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error):
                    completionHandler(error)
                case .finished:
                    completionHandler(nil)
                }
            }, receiveValue: {uid in
                print("SUCCESS: \(uid)")
            }).store(in: &cancellables)
    }
    
    func login(email: String, password: String, completionHandler: @escaping (AuthError?) -> Void) {
        self.authRepo.login(email: email, password: password)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error):
                    completionHandler(error)
                case .finished:
                    completionHandler(nil)
                }
            }, receiveValue: {userId in
                ()
            }).store(in: &self.cancellables)
    }
    
    func logout(completionHandler: @escaping (AuthError?) -> Void)  {
        self.authRepo.logout().sink(receiveCompletion: {completion in
            switch completion {
            case .failure(let error):
                completionHandler(error)
            case .finished:
                completionHandler(nil)
            }
        }, receiveValue: { () }).store(in: &self.cancellables)
    }
    
    func detach() {
        self.authHandle.cancel()
    }
}
