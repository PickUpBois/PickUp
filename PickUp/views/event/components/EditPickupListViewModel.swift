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
}

class MockEditPickupListViewModel: EditPickUpListViewModel {
    override init(){
        super.init()
        let attendees: [EventDetails.Attendee] = []
        let event1 = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open)
        let event2 = event1
        self.events = [event1, event2]
    }
}

