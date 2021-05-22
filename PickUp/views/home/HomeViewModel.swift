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
    @Published var events: [EventType: [QueryEventsQuery.Data.QueryEvent]] = [:]
    func getUpcomingEvents() {
        if (AppState.shared.authId != nil) {
            Services.shared.apollo.fetch(query: QueryEventsQuery(userId: AppState.shared.authId!, type: nil, status: .open)) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0].localizedDescription)
                    }
                    guard let data = result.data else {
                        print("error in graphql query")
                        return
                    }
                    let events = data.queryEvents
                    for type in EventType.allCases {
                        self.events[type] = events.filter { event in
                            return event.type == type
                        }
                    }
                    self.objectWillChange.send()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

class MockHomeViewModel: HomeViewModel {
    override func getUpcomingEvents() {
        self.events = [:]
    }
}
