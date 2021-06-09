//
//  NotificationViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/7/21.
//

import Foundation

class NotificationViewModel: ObservableObject {
    let notificationId: String
    let type: NotificationType
    let timestamp: Date
    let event: EventDetails?
    let actor: UserDetails?
    let getNotifications: () -> Void
    
    
    init(notificationId: String, type: NotificationType, timestamp: Date, event: EventDetails?, actor: UserDetails?, getNotifications: @escaping () -> Void) {
        self.getNotifications = getNotifications
        self.event = event
        self.actor = actor
        self.notificationId = notificationId
        self.timestamp = timestamp
        self.type = type
    }
    
    
    func acceptFriendRequest(friendId: String) {
        Services.shared.apollo.perform(mutation: AcceptFriendRequestMutation(userId: AppState.shared.authId!, friendId: friendId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                self.getNotifications()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func rejectFriendRequest(friendId: String) {
        Services.shared.apollo.perform(mutation: RejectFriendRequestMutation(userId: AppState.shared.authId!, friendId: friendId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                self.getNotifications()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func readNotification(id: String) {
        Services.shared.apollo.perform(mutation: ReadNotificationMutation(id: String(id))) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                guard let data = result.data else {
                    print("error in graphql mutation")
                    return
                }
                self.getNotifications()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func acceptEventInvitation(eventId: String) {
        Services.shared.apollo.perform(mutation: AcceptEventInvitationMutation(eventId: eventId, userId: AppState.shared.authId!)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                guard let data = result.data else {
                    print("error in accepting event inivitation")
                    return
                }
                self.getNotifications()
                return
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func declineEventInvitation(eventId: String) {
        Services.shared.apollo.perform(mutation: DeclineEventInvitationMutation(eventId: eventId, userId: AppState.shared.authId!)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                guard let data = result.data else {
                    print("error in declining event inivitation")
                    return
                }
                self.getNotifications()
                return
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func endEvent(input: EndEventInput) {
        Services.shared.apollo.perform(mutation: EndEventMutation(input: input)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                self.getNotifications()
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
}

class MockNotificationViewModel: NotificationViewModel {
    init() {
        let actor = UserDetails(id: "1", firstName: "1", lastName: "last", username: "username")
        let attendees: [EventDetails.Attendee] = []
        let event = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open)
        super.init(notificationId: "0", type: .friendRequestSend, timestamp: Date(), event: event, actor: actor, getNotifications: { return })
    }
}
