//
//  EditPickupViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/23/21.
//

import Foundation

class EditPickupViewModel {
    @Published var invitedAttendees: [String] = []
    var event: EventDetails
    init(event: EventDetails) {
        self.event = event
        self.invitedAttendees = []
    }
    func getEvent() {
        Services.shared.apollo.fetch(query: GetEventQuery(eventId: String(event.id)), cachePolicy: .fetchIgnoringCacheCompletely) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                let invitedAttendees = result.data?.getEvent.invitedAttendees.map { attendee in
                    return attendee.id
                } ?? []
                self.invitedAttendees = invitedAttendees
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
