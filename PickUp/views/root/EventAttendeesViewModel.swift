//
//  EventAttendeesViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/24/21.
//

import Foundation

class EventAttendeesViewModel: ObservableObject {
    @Published var attendees: [UserDetails] = []
    
    init(attendees: [UserDetails]) {
        self.attendees = attendees
    }
}

class MockEventAttendeesViewModel: EventAttendeesViewModel {
    override init(attendees: [UserDetails] = []) {
        super.init(attendees: attendees)
    }
}
