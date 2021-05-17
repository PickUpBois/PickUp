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

struct MockGetEventsUseCase: IGetEventsUseCase {
    func execute(userId: String?, status: EventStatus?, type: EventType?) -> AnyPublisher<[Event], Error> {
        let event1 = Event(id: "1", name: "event", info: "info", startDate: Date(), endDate: nil, capacity: 4, attendees: [], type: .tennis, status: .open)
        let event2 = Event(id: "2", name: "event", info: "info", startDate: Date(), endDate: nil, capacity: 4, attendees: [], type: .tennis, status: .open)
        return Just<[Event]>([event1, event2]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    
}
