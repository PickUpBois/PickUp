//
//  ICreateEventUseCase.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/14/21.
//

import Foundation
import Combine

protocol ICreateEventUseCase {
    func execute(item: CreateEventInput) -> AnyPublisher<Void, Error>
}

struct CreateEventUseCase: ICreateEventUseCase {
    let eventRepo: IEventRepo = RepoFactory.getEventRepo()
    func execute(item: CreateEventInput) -> AnyPublisher<Void, Error> {
        return eventRepo.create(event: item)
    }
}
