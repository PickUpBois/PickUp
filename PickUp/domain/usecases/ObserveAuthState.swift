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
         userRepo: IUserRepo = UserRepo()) {
        self.authRepo = authRepo
        self.userRepo = userRepo
    }
    
    func listen() {
        self.authHandle = authRepo.observeAuthState().sink(receiveValue: {dataAuth in
            if dataAuth != nil {
                self.userRepo.get(id: dataAuth!.id)
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
                    }).store(in: &self.cancellables)
            } else {
                self.authUser = nil
                self.objectWillChange.send()
            }
        })
    }
    
    func refreshProfile() {
    
    }
    
    func detach() {
        self.authHandle.cancel()
    }
}
