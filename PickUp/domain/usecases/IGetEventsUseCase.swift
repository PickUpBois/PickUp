//
//  IGetEventsUseCase.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import Foundation
import Combine

protocol IGetUserEventsByStatusUseCase {
    func execute(userId: String, status: EventStatus) -> AnyPublisher<[Event], Error>
}

struct GetUserEventsByStatusUseCase: IGetUserEventsByStatusUseCase {
    let eventRepo: IEventRepo
    init(eventRepo: IEventRepo = RepoFactory.getEventRepo()) {
        self.eventRepo = eventRepo
    }
    func execute(userId: String, status: EventStatus) -> AnyPublisher<[Event], Error> {
        return eventRepo.getUserEvents(userId: userId, status: status)
    }
}
