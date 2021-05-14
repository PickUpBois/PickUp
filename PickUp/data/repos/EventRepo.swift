//
//  EventRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/13/21.
//

import Foundation
import Combine

protocol IEventRepo {
    func create(event: CreateEventDto) -> AnyPublisher<Void, Error>
}

enum EventError: Error {
    case error(String)
}

class EventRepo: IEventRepo {
    func create(event: CreateEventDto) -> AnyPublisher<Void, Error> {
        let url = URL(string: RepoFactory.TARGET_URL + "events/")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        guard let postData = try? JSONSerialization.data(withJSONObject: event, options: []) else {
            print("failed to encode json data")
            return Fail(error: EventError.error("failed to encode jsond ata")).eraseToAnyPublisher()
        }
        urlRequest.httpBody = postData
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { element -> Void in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
            }
            .eraseToAnyPublisher()
    }
}
