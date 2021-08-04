//
//  EventDetailsBoxViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/22/21.
//

import Foundation

class EventDetailsBoxViewModel: ObservableObject {
    let refresh: () -> Void
    let event: EventDetails
    let attendeeStatus: event_attendee_status_enum?
    let attendeesViewModel: EventAttendeesViewModel
    var userId: String? = nil
    init(event: EventDetails, refresh: @escaping () -> Void = {}, userId: String? = AppState.shared.authId) {
        self.event = event
        self.refresh = refresh
        var attendeeStatus: event_attendee_status_enum? {
            for i in 0..<event.attendees.count {
                let attendee = event.attendees[i]
                if attendee.fragments.attendeeDetails.user.fragments.userDetails.id == AppState.shared.authId {
                    return attendee.fragments.attendeeDetails.status
                }
            }
            return nil
        }
        self.attendeeStatus = attendeeStatus
        let attendees = event.attendees.map { attendee in
            return attendee.fragments.attendeeDetails
        }
        self.attendeesViewModel = EventAttendeesViewModel(attendees: attendees)
        self.userId = userId
    }
    
    func commitAction(eventId: Int) {
        switch attendeeStatus {
        case .ok:
            leaveEvent(eventId: eventId)
        case .none:
            joinEvent(eventId: eventId)
        default:
            return
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
                self.refresh()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func leaveEvent(eventId: Int) {
        Services.shared.apollo.perform(mutation: LeaveEventMutation(eventId: eventId)) { response in
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
                self.refresh()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteEvent(eventId: Int) {
        Services.shared.apollo.perform(mutation: DeleteEventMutation(eventId: eventId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                self.refresh()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

class MockEventDetailsBoxViewModel: EventDetailsBoxViewModel {
    override func joinEvent(eventId: Int) {
        return
    }
    
    override func leaveEvent(eventId: Int) {
        return
    }
}
