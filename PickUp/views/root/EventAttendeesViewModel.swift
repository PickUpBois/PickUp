//
//  EventAttendeesViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/24/21.
//

import Foundation

class EventAttendeesViewModel: ObservableObject {
    @Published var attendees: [AttendeeDetails] = []
    
    init(attendees: [AttendeeDetails]) {
        self.attendees = attendees
    }
}

class MockEventAttendeesViewModel: EventAttendeesViewModel {
    override init(attendees: [AttendeeDetails] = []) {
        super.init(attendees: attendees)
    }
}
