//
//  IUpdateProfileUseCase.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/30/21.
//

import Foundation
import Combine

enum ProfileField: String, Hashable {
    case firstName = "firstName"
    case lastName = "lastName"
    case username = "username"
    case college = "college"
}

protocol IUpdateProfileUseCase {
    func execute(userId: String, fields: [ProfileField: Any?]) -> AnyPublisher<Void, Error>
}

class UpdateProfileUseCase: IUpdateProfileUseCase {
    var userRepo: UserRepo
    init(userRepo: UserRepo = RepoFactory.getUserRepo()) {
        self.userRepo = userRepo
    }
    func execute(userId: String, fields: [ProfileField: Any?]) -> AnyPublisher<Void, Error> {
        return userRepo.update(id: userId, fields: fields as [AnyHashable : Any?])
    }
}
