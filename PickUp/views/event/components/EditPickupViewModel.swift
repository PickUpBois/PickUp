//
//  EditPickupViewModel.swift
//  PickUp
//
//  Created by David Reynolds on 6/10/21.
//

import Foundation


class EditPickUpViewModel: ObservableObject {
    @Published var events: [EventDetails] = []
}

class MockEditPickupViewModel: EditPickUpViewModel {
    override init(){
        super.init()
        let attendees: [EventDetails.Attendee] = []
        let event1 = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open)
        let event2 = event1
        self.events = [event1, event2]
    }
}

