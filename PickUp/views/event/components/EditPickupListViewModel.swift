//
//  EditPickupViewModel.swift
//  PickUp
//
//  Created by David Reynolds on 6/10/21.
//

import Foundation


class EditPickUpListViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case success
        case fail(Error)
    }
    var events: [EventDetails] = []
    @Published var state: State = .idle
    var friendsListViewModel: FriendsListViewModel = FriendsListViewModel(userId: AppState.shared.authId!)
    func getEvents() {
        state = .loading
        guard let userId = AppState.shared.authId else {
            return
        }
        Services.shared.apollo.fetch(query: CurrentlyOwnedEventsQuery(userId: userId), cachePolicy: .fetchIgnoringCacheCompletely) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    self.state = .fail(errors[0])
                }
                self.events = result.data?.events.map {
                    return $0.fragments.eventDetails
                }.sorted(by: >) ?? []
                self.state = .success
            case .failure(let error):
                print(error.localizedDescription)
                self.state = .fail(error)
            }
        }
    }
}

class MockEditPickupListViewModel: EditPickUpListViewModel {
    override init(){
        super.init()
        let attendees: [EventDetails.Attendee] = []
        let event1 = EventDetails(id: 1, name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open, teams: [])
        let event2 = event1
        self.events = [event1, event2]
    }
    
    override func getEvents() {
        return
    }
}

