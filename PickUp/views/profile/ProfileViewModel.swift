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
    @Published var loading: Bool = false
    var upcomingEvents: [EventDetails] = []
    var pastEvents: [EventDetails] = []
    var userId: String
    var cancellables = Set<AnyCancellable>()
    var user: GetUserQuery.Data.User?
    init(userId: String) {
        self.userId = userId
    }
    
    func retrieveState() {
        loading = true
        let group = DispatchGroup()
        retrieveUser(group: group)
        getEvents(status: .open, group: group)
        getEvents(status: .closed, group: group)
        group.notify(queue: .main) { [weak self] in
            self?.loading = false
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
                Services.shared.apollo.perform(mutation: RemoveDeviceTokenMutation(userId: userId, token: token)) { response in
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
        Services.shared.apollo.fetch(query: GetUserQuery(id: userId, authId: AppState.shared.authId ?? "1"), cachePolicy: .fetchIgnoringCacheCompletely) { response in
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
                print("user \(data.user)")
                self.user = data.user
                group?.leave()
            case .failure(let error):
                print(error.localizedDescription)
                group?.leave()
            }
        }
    }
    
    func addFriend() {
        Services.shared.apollo.perform(mutation: SendFriendRequestMutation(userId: AppState.shared.authId!, friendId: userId)) { response in
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
        Services.shared.apollo.perform(mutation: RemoveFriendMutation(userId: AppState.shared.authId!, friendId: userId)) { response in
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
    
    
    func getEvents(status: EventStatus, group: DispatchGroup? = nil) {
        group?.enter()
        Services.shared.apollo.fetch(query: GetUserEventsQuery(userId: userId, status: status), cachePolicy: .fetchIgnoringCacheCompletely) { response in
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
                if status == .open {
                    self.upcomingEvents = data.userEvents.map { userEvent in
                        return userEvent.fragments.eventDetails
                    }
                } else {
                    self.pastEvents = data.userEvents.map { userEvent in
                        return userEvent.fragments.eventDetails
                    }
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
        self.user = GetUserQuery.Data.User(id: "1", firstName: "arahbar", lastName: "David", username: "Reynolds", college: "", goatScore: 4, friends: [])
    }
    
    override func logout() {
        return
    }
    
    func updateProfilePicByUrl(userId: String) {
        return
    }
    
    override func getEvents(status: EventStatus, group: DispatchGroup? = nil) {
        let attendees: [EventDetails.Attendee] = []
        let event1 = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open)
        let event2 = event1
        self.upcomingEvents = [event1, event2]
        self.pastEvents = []
    }
}


