//
//  InviteFriendsViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/23/21.
//

import Foundation

class InviteFriendsViewModel: ObservableObject {
    let event: EventDetails
    @Published var invitedUsers: [String]
    var attendees: [String] = []
    init(event: EventDetails) {
        self.event = event
        self.invitedUsers = []
        let attendees = event.attendees.map { attendee in
            return attendee.fragments.attendeeDetails.id
        }
        self.attendees = attendees
    }
    
    func getEvent() {
        Services.shared.apollo.fetch(query: GetEventQuery(eventId: event.id), cachePolicy: .fetchIgnoringCacheCompletely) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                let invitedAttendees = result.data?.eventsByPk!.invitedAttendees.map { attendee in
                    return attendee.id
                } ?? []
                let attendees = result.data?.eventsByPk!.attendees.map { attendee in
                    return attendee.id
                } ?? []
                self.invitedUsers = invitedAttendees
                self.attendees = attendees
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func inviteFriend(friendId: String) {
        Services.shared.apollo.perform(mutation: InviteUserToEventMutation(eventId: event.id, userId: friendId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                self.getEvent()
                return
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func cancelEventInvitation(friendId: String) {
        Services.shared.apollo.perform(mutation: CancelEventInvitationMutation(eventId: event.id, userId: friendId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                self.getEvent()
                return
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

class MockInviteFriendsViewModel: InviteFriendsViewModel {
    override func getEvent() {
        return
    }
    override func inviteFriend(friendId: String) {
        return
    }
}
