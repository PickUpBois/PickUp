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
    let attendeeStatus: EventAttendeeStatus?
    let attendeesViewModel: EventAttendeesViewModel
    var userId: String? = nil
    init(event: EventDetails, refresh: @escaping () -> Void = {}, userId: String? = AppState.shared.authId) {
        self.event = event
        self.refresh = refresh
        var attendeeStatus: EventAttendeeStatus? {
            for i in 0..<event.attendees.count {
                let attendee = event.attendees[i]
                if attendee.fragments.userDetails.id == AppState.shared.authId {
                    return attendee.fragments.userDetails.eventAttendeeStatus
                }
            }
            return nil
        }
        self.attendeeStatus = attendeeStatus
        let attendees = event.attendees.map { attendee in
            return attendee.fragments.userDetails
        }
        self.attendeesViewModel = EventAttendeesViewModel(attendees: attendees)
        self.userId = userId
    }
    
    func commitAction(eventId: String) {
        switch attendeeStatus {
        case .ok:
            leaveEvent(eventId: eventId)
        case .none:
            joinEvent(eventId: eventId)
        default:
            return
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
                self.refresh()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func leaveEvent(eventId: String) {
        Services.shared.apollo.perform(mutation: LeaveEventMutation(userId: AppState.shared.authId!, eventId: eventId)) { response in
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
    
    func deleteEvent(eventId: String) {
        Services.shared.apollo.perform(mutation: DeleteEventMutation(userId: AppState.shared.authId!, eventId: eventId)) { response in
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
    override func joinEvent(eventId: String) {
        return
    }
}
