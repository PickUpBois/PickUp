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
    func getUpcomingEvents() {
        print("getting events")
        if (AppState.shared.authId != nil) {
            eventsState = .loading
            Services.shared.apollo.fetch(query: QueryEventsQuery(userId: nil, type: nil, status: .open), cachePolicy: .fetchIgnoringCacheCompletely) { response in
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
                    self.events = data.queryEvents.map { queryEvent in
                        return queryEvent.fragments.eventDetails
                    }
                    self.eventsState = .success
                    print("got events")
                    self.objectWillChange.send()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.eventsState = .error(error)
                }
            }
        }
    }
    
    func joinEvent(eventId: String) {
        Services.shared.apollo.perform(mutation: JoinEventMutation(userId: AppState.shared.authId!, eventId: eventId)) { response in
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
        let actor = GetNotificationsQuery.Data.User.Notification.Actor(id: "1", firstName: "1", lastName: "lastName", username: "username")
        let notification = GetNotificationsQuery.Data.User.Notification(id: "1", createdAt: Date().isoString, type: .friendRequestAccept, actor: actor, event: nil)
        super.init()
    }
    
    override func getUpcomingEvents() {
        self.events = []
    }
}
