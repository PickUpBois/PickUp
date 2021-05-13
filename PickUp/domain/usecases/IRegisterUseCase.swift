//
//  IRegisterUseCase.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/18/21.
//

import Foundation
import Combine

protocol IRegisterUseCase {
    func execute(email: String, password: String, user: User) -> AnyPublisher<Void, Error>
}

struct RegisterUseCase: IRegisterUseCase {
    let authRepo: AuthRepo
    let userRepo: IUserRepo
    
    init(authRepo: AuthRepo = RepoFactory.getAuthRepo(),
         userRepo: IUserRepo = RepoFactory.getUserRepo()) {
        self.authRepo = authRepo
        self.userRepo = userRepo
    }
    
    func execute(email: String, password: String, user: User) -> AnyPublisher<Void, Error> {
        return authRepo.signup(email: email, password: password)
            .flatMap({ userId -> AnyPublisher<Void, Error> in
                user.id = userId
                return userRepo.create(item: user)
            }).eraseToAnyPublisher()
    }
    
    
    
    
}
