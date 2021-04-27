//
//  IRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/17/21.
//

import Foundation
import Combine

protocol IDao {
    associatedtype Item
    func create(item: Item) -> AnyPublisher<Void, Error>
    func read(id: String) -> AnyPublisher<Item, Error>
    func update(item: Item) -> AnyPublisher<Void, Error>
    func delete(id: String) -> AnyPublisher<Void, Error>
}
