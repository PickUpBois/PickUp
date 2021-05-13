//
//  IObserveAuthState.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/18/21.
//

import Foundation
import Combine

class ObserveAuthState: ObservableObject {
    static let shared: ObserveAuthState = ObserveAuthState()
    private var authRepo: AuthRepo!
    private var userRepo: IUserRepo
    @Published private(set) var authUser: UserAuth? = nil
    var authHandle: AnyCancellable!
    var userHandle: AnyCancellable!
    var cancellables = Set<AnyCancellable>()
    
    init(authRepo: AuthRepo = RepoFactory.getAuthRepo(),
         userRepo: IUserRepo = RepoFactory.getUserRepo()) {
        self.authRepo = authRepo
        self.userRepo = userRepo
    }
    
    func listen() {
        self.authHandle = authRepo.observeAuthState().sink(receiveValue: {dataAuth in
            if dataAuth != nil {
                self.userHandle = self.userRepo.get(id: dataAuth!.id)
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .failure(let error):
                            print("errror getting user: \(error.localizedDescription)")
                        case .finished:
                            print("success")
                        
                        }
                    }, receiveValue: { user in
                        self.authUser = user.toUserAuth(email: dataAuth!.email,
                                        isEmailVerified: dataAuth!.isEmailVerified)
                        self.objectWillChange.send()
                    })
            } else {
                self.authUser = nil
                if self.userHandle != nil {
                    self.userHandle.cancel()
                    self.userHandle = nil
                }
                self.objectWillChange.send()
            }
        })
    }
    
    func refreshUser() {
        if self.authUser == nil {
            return
        }
        self.userRepo.get(id: self.authUser!.id!)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("error refreshing user \(error.localizedDescription)")
                case .finished:
                    print("success")
                }
            }, receiveValue: { user in
                self.authUser = user.toUserAuth(email: self.authUser!.email, isEmailVerified: self.authUser!.isEmailVerified);
                self.objectWillChange.send()
            }).store(in: &self.cancellables)
    }
    
    func detach() {
        self.authHandle.cancel()
        self.authHandle = nil
        if (self.userHandle != nil) {
            self.userHandle.cancel()
            self.userHandle = nil
        }
    }
}
