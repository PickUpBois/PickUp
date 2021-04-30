//
//  IUserRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/18/21.
//

import Foundation
import Combine
import Firebase

protocol IUserRepo {
    func create(item: User) -> AnyPublisher<Void, Error>
    func get(id: String) -> AnyPublisher<User, Error>
    func update(id: String, fields: [ AnyHashable : Any? ]) -> AnyPublisher<Void, Error>
    func delete(id: String) -> AnyPublisher<Void, Error>
    func observe(id: String) -> AnyPublisher<User, Error>
}
