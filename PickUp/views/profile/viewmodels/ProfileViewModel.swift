//
//  ProfileViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine
import FirebaseMessaging

class ProfileViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case success
        case failure(Error)
    }
    @Published var state: State = .idle
    var upcomingEvents: [EventDetails] = []
    var pastEvents: [EventDetails] = []
    var userId: String
    var cancellables = Set<AnyCancellable>()
    var user: UserDetails?
    var numFriends: Int?
    init(userId: String) {
        self.userId = userId
    }
    
    func retrieveState() {
        state = .loading
        let group = DispatchGroup()
        retrieveUser(group: group)
        getEvents(status: .open, group: group)
        getEvents(status: .closed, group: group)
        group.notify(queue: .main) { [weak self] in
            self?.state = .success
        }
    }
    
    func refresh() {
        self.objectWillChange.send()
    }
    
    func removeDeviceToken(userId: String) {
        Messaging.messaging().token(completion: {token, error in
            if let error = error {
                return print("unable to get token: \(error.localizedDescription)")
            }
            if let token = token {
                Services.shared.apollo.perform(mutation: RemoveDeviceTokenMutation(token: token)) { response in
                    switch response {
                    case .success(let result):
                        if let errors = result.errors {
                            print("unable to remove token: \(errors[0].localizedDescription)")
                        }
                        
                    case .failure(let error):
                        return print("unable to remove token: \(error.localizedDescription)")
                    }
                }
            }
        })
    }
    
    func logout() {
        let userId = AppState.shared.authId
        if userId != nil{
            Services.shared.auth.logout().sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                default:
                    ()
                }
                self.removeDeviceToken(userId: userId!)
            }, receiveValue: {() in ()})
            .store(in: &self.cancellables)
        }
        
    }
    
    func retrieveUser(group: DispatchGroup? = nil) {
        group?.enter()
        Services.shared.apollo.fetch(query: GetUserQuery(userId: AppState.shared.authId ?? "1"), cachePolicy: .fetchIgnoringCacheCompletely) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    group?.leave()
                    return
                }
                guard let data = result.data else {
                    print("error in graphql query")
                    group?.leave()
                    return
                }
                print("user \(data.user?.fragments.userDetails)")
                self.user = data.user?.fragments.userDetails
                self.numFriends = data.user?.friends?.count ?? 0
                group?.leave()
            case .failure(let error):
                print(error.localizedDescription)
                group?.leave()
            }
        }
    }
    
    func addFriend() {
        Services.shared.apollo.perform(mutation: SendFriendRequestMutation(friendId: userId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                self.retrieveState()
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func removeFriend() {
        Services.shared.apollo.perform(mutation: RemoveFriendMutation(userId: userId)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                self.retrieveState()
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    
    func getEvents(status: event_status_enum, group: DispatchGroup? = nil) {
        group?.enter()
        Services.shared.apollo.fetch(query: GetJoinedEventsByStatusQuery(userId: userId, status: status), cachePolicy: .fetchIgnoringCacheCompletely) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                guard let data = result.data else {
                    print("error in graphql query")
                    group?.leave()
                    return
                }
                var events = data.events.map { event in
                    return event.fragments.eventDetails
                }
                events.sort(by: >)
                if status == .open {
                    self.upcomingEvents = events
                } else {
                    self.pastEvents = events
                }
                group?.leave()
                return
            case .failure(let error):
                print(error.localizedDescription)
                group?.leave()
                return
            }
            
        }
    }
    
}

class MockProfileViewModel: ProfileViewModel {
    
    override func retrieveUser(group: DispatchGroup? = nil) {
        self.user = UserDetails(id: "1", firstName: "David", lastName: "Reynolds", username: "dave")
    }
    
    override func logout() {
        return
    }
    
    func updateProfilePicByUrl(userId: String) {
        return
    }
    
    override func getEvents(status: event_status_enum, group: DispatchGroup? = nil) {
        let attendees: [EventDetails.Attendee] = []
        let event1 = EventDetails(id: 1, name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open, teams: [])
        let event2 = event1
        self.upcomingEvents = [event1, event2]
        self.pastEvents = []
    }
}


