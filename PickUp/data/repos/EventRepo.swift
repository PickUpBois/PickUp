//
//  EventRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/13/21.
//

import Foundation
import Combine

protocol IEventRepo {
    func create(event: CreateEventInput) -> AnyPublisher<Void, Error>
    func getUserEvents(userId: String, status: EventStatus) -> AnyPublisher<[Event], Error>
    
}

enum EventError: Error {
    case error(String)
}

class EventApolloRepo: IEventRepo {
    func create(event: CreateEventInput) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            Network.shared.apollo.perform(mutation: CreateEventMutation(input: event)) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        return promise(.failure(errors[0]))
                    }
                    return promise(.success(()))
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func getUserEvents(userId: String, status: EventStatus) -> AnyPublisher<[Event], Error> {
        return Future<[Event], Error> { promise in
            Network.shared.apollo.fetch(query: GetUserEventsQuery(userId: userId, status: status), cachePolicy: .fetchIgnoringCacheCompletely) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        return promise(.failure(errors[0]))
                    }
                    guard let data = result.data else {
                        print("error in graphql query")
                        return promise(.failure(EventError.error("error in graphql query")))
                    }
                    var events: [Event] = []
                    for event in data.userEvents {
                        var attendees: [User] = []
                        for attendee in event.attendees {
                            attendees.append(User(id: attendee.id, username: attendee.username, firstName: attendee.firstName, lastName: attendee.lastName, photoUrl: attendee.photoUrl))
                        }
                        let isoDateFormatter = ISO8601DateFormatter()
                        isoDateFormatter.formatOptions = [.withColonSeparatorInTime, .withColonSeparatorInTime]
                        guard let startDate = isoDateFormatter.date(from: event.startDate) else {
                            print(event.startDate)
                            print("start date could not be parsed")
                            return promise(.failure(EventError.error("start date could not be parsed")))
                        }
                        let endDate: Date? = event.endDate != nil ? ISO8601DateFormatter().date(from: event.endDate!) : nil
                        events.append(Event(id: event.id, name: event.name, info: event.info, startDate: startDate, endDate: endDate, capacity: event.capacity, attendees: attendees, type: event.type, status: event.status))
                    }
                    return promise(.success(events))
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
