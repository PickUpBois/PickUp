//
//  ProfileViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var logoutError = ""
    @Published var updateProfileError = ""
    @Published var loading = false
    @Published var imageUri: String? = nil
    @Published var textUrl: String = ""
    @Published var showPhotoLibrary = false
    @Published var upcomingEvents: [GetUserEventsQuery.Data.UserEvent] = []
    @Published var pastEvents: [GetUserEventsQuery.Data.UserEvent] = []
    var userId: String
    var cancellables = Set<AnyCancellable>()
    @Published var user: GetUserQuery.Data.User?
    init(userId: String) {
        self.userId = userId
    }
    
    func logout() {
        Services.shared.auth.logout().sink(receiveCompletion: {completion in
            switch completion {
            case .failure(let error):
                self.logoutError = error.localizedDescription
            default:
                ()
            }
        }, receiveValue: {() in ()})
        .store(in: &self.cancellables)
    }
    
    func retrieveUser() {
        Services.shared.apollo.fetch(query: GetUserQuery(id: userId), cachePolicy: .fetchIgnoringCacheCompletely) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                guard let data = result.data else {
                    print("error in graphql query")
                    return
                }
                self.user = data.user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getEvents(status: EventStatus) {
        Services.shared.apollo.fetch(query: GetUserEventsQuery(userId: userId, status: status), cachePolicy: .fetchIgnoringCacheCompletely) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                guard let data = result.data else {
                    print("error in graphql query")
                    return
                }
                self.upcomingEvents = data.userEvents
                
                return
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
}

class MockProfileViewModel: ProfileViewModel {
    
    override func retrieveUser() {
        self.user = GetUserQuery.Data.User(id: "1", firstName: "arahbar", lastName: "David", username: "Reynolds", college: "")
    }
    
    override func logout() {
        return
    }
    
    func updateProfilePicByUrl(userId: String) {
        return
    }
    
    override func getEvents(status: EventStatus) {
        let event1 = GetUserEventsQuery.Data.UserEvent(id: "1", name: "2", info: "3", startDate: Date().isoString, capacity: 4, type: .tennis, status: .open, attendees: [])
        let event2 = GetUserEventsQuery.Data.UserEvent(id: "2", name: "2", info: "3", startDate: Date().isoString, capacity: 4, type: .tennis, status: .open, attendees: [])
        self.upcomingEvents = [event1, event2]
        self.pastEvents = []
    }
}


