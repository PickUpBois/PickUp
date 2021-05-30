//
//  HomeViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine



class HomeViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var events: [QueryEventsQuery.Data.QueryEvent] = []
    @Published var friendRequests: [GetFriendRequestsQuery.Data.User.FriendRequest] = []
    @Published var notifications: [GetNotificationsQuery.Data.User.Notification] = []
    func getUpcomingEvents() {
        if (AppState.shared.authId != nil) {
            Services.shared.apollo.fetch(query: QueryEventsQuery(userId: AppState.shared.authId!, type: nil, status: .open), cachePolicy: .fetchIgnoringCacheCompletely) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0].localizedDescription)
                    }
                    guard let data = result.data else {
                        print("error in graphql query")
                        return
                    }
                    self.events = data.queryEvents
                    
                    self.objectWillChange.send()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getNotifications() {
        if AppState.shared.authId != nil {
                Services.shared.apollo.fetch(query: GetNotificationsQuery(userId: AppState.shared.authId!), cachePolicy: .fetchIgnoringCacheCompletely) { response in
                    switch response {
                    case .success(let result):
                        if let errors = result.errors {
                            print(errors[0].localizedDescription)
                        }
                        guard let data = result.data else {
                            print("error in graphql query")
                            return
                        }
                        self.notifications = data.user.notifications
                        self.objectWillChange.send()
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            
            }
        }
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
    
    func getFriendRequests() {
        if AppState.shared.authId != nil {
            Services.shared.apollo.fetch(query: GetFriendRequestsQuery(userId: AppState.shared.authId!), cachePolicy: .fetchIgnoringCacheCompletely) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0].localizedDescription)
                        return
                    }
                    guard let data = result.data else {
                        print("error in getting friend requests")
                        return
                    }
                    self.friendRequests = data.user.friendRequests
                case .failure(let error):
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
}

class MockHomeViewModel: HomeViewModel {
    override func getUpcomingEvents() {
        self.events = []
    }
    
    override func getNotifications() {
    }
    
    override func acceptFriendRequest(friendId: String) {
        return
    }
    
    override func rejectFriendRequest(friendId: String) {
        return
    }
}
