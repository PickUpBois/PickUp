//
//  HomeViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine



class HomeViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var events: [EventDetails] = []
    enum State {
        case idle
        case loading
        case success
        case error(Error)
    }
    @Published var eventsState: State = .idle
    @Published var eventsShowing: Bool = false
    func getUpcomingEvents() {
        print("getting events")
        if (AppState.shared.authId != nil) {
            eventsState = .loading
            Services.shared.apollo.fetch(query: GetUpcomingEventsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print("error in getting events")
                        print(errors[0].errorDescription)
                        self.eventsState = .error(errors[0])
                    }
                    guard let data = result.data else {
                        print("error in graphql query")
                        return
                    }
                    self.events = data.events.map { queryEvent in
                        return queryEvent.fragments.eventDetails
                    }.sorted(by: >)
                    self.eventsState = .success
                    self.eventsShowing = false
                    print("got events")
                    self.objectWillChange.send()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.eventsState = .error(error)
                }
            }
        }
    }
    
    func joinEvent(eventId: Int) {
        Services.shared.apollo.perform(mutation: JoinEventMutation(eventId: eventId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                guard let data = result.data else {
                    print("error joining event")
                    return
                }
                self.getUpcomingEvents()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}

class MockHomeViewModel: HomeViewModel {
    override init() {
        super.init()
    }
    
    override func getUpcomingEvents() {
        self.events = []
    }
}
