//
//  IGetEventsUseCase.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import Foundation
import Combine

protocol IGetEventsUseCase {
    func execute(userId: String?, status: EventStatus?, type: EventType?) -> AnyPublisher<[Event], Error>
}

struct GetEventsUseCase: IGetEventsUseCase {
    let eventRepo: IEventRepo
    init(eventRepo: IEventRepo = RepoFactory.getEventRepo()) {
        self.eventRepo = eventRepo
    }
    func execute(userId: String?, status: EventStatus?, type: EventType?) -> AnyPublisher<[Event], Error> {
        return eventRepo.queryEvents(userId: userId, status: status, type: type)
    }
}
