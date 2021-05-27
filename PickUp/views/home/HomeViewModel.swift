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
}

class MockHomeViewModel: HomeViewModel {
    override func getUpcomingEvents() {
        self.events = []
    }
}
