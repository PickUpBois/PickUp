//
//  NotificationViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/7/21.
//

import Foundation

enum ResultStatus {
    case loading
    case success
    case failure
}

enum ActionStatus2 {
    case none
    case ip
    case loading
    case success
    case failure
}

class NotificationViewModel: ObservableObject, Comparable {
    static func == (lhs: NotificationViewModel, rhs: NotificationViewModel) -> Bool {
        return lhs.notificationId == rhs.notificationId
    }
    
    static func < (lhs: NotificationViewModel, rhs: NotificationViewModel) -> Bool {
        return lhs.timestamp < rhs.timestamp
    }
    
    let notificationId: Int
    let type: notification_type_enum
    let timestamp: Date
    let event: EventDetails?
    let actor: UserDetails?
    let getNotifications: () -> Void
    @Published var actionStatus: ActionStatus2 = .none
    
    
    init(notificationId: Int, type: notification_type_enum, timestamp: Date, event: EventDetails?, actor: UserDetails?, getNotifications: @escaping () -> Void) {
        self.getNotifications = getNotifications
        self.event = event
        self.actor = actor
        self.notificationId = notificationId
        self.timestamp = timestamp
        self.type = type
    }
    
    
    func acceptFriendRequest(friendId: String) {
        Services.shared.apollo.perform(mutation: AcceptFriendRequestMutation(userId: friendId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                self.readNotification()
//                self.getNotifications()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func rejectFriendRequest(friendId: String) {
        Services.shared.apollo.perform(mutation: RejectFriendRequestMutation(userId: friendId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                self.readNotification()
//                self.getNotifications()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func readNotification() {
        Services.shared.apollo.perform(mutation: ReadNotificationMutation(notificationId: self.notificationId)) { response in
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
    
    func acceptEventInvitation(eventId: Int) {
        Services.shared.apollo.perform(mutation: AcceptEventInvitationMutation(eventId: eventId)) { response in
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
                self.readNotification()
//                self.getNotifications()
                return
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func declineEventInvitation(eventId: Int) {
        Services.shared.apollo.perform(mutation: DeclineEventInvitationMutation(eventId: eventId)) { response in
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
                self.readNotification()
//                self.getNotifications()
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
                self.readNotification()
//                self.getNotifications()
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func voteForMvp(eventId: Int, voteeId: String) {
        self.actionStatus = .loading
        Services.shared.apollo.perform(mutation: VoteForMvpMutation(eventId: eventId, userId: voteeId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print("voting for mvp error")
                    print(errors[0].localizedDescription)
                    self.actionStatus = .failure
                    return
                }
                self.actionStatus = .success
                self.readNotification()
            case .failure(let error):
                print("voting for mvp error")
                print(error.localizedDescription)
            }
        }
    }
}

class MockNotificationViewModel: NotificationViewModel {
    init() {
        let actor = UserDetails(id: "1", firstName: "1", lastName: "last", username: "username")
        let attendees: [EventDetails.Attendee] = []
        let event = EventDetails(id: 1, name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open, teams: [])
        super.init(notificationId: 0, type: .friendRequestSend, timestamp: Date(), event: event, actor: actor, getNotifications: { return })
    }
}
