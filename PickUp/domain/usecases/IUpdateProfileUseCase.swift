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
    func execute(userId: String, fields: [String: Any]) -> AnyPublisher<Void, Error>
}

class UpdateProfileUseCase: IUpdateProfileUseCase {
    var userRepo: IUserRepo
    init(userRepo: IUserRepo = RepoFactory.getUserRepo()) {
        self.userRepo = userRepo
    }
    func execute(userId: String, fields: [String: Any]) -> AnyPublisher<Void, Error> {
        return userRepo.update(id: userId, fields: fields)
    }
}
