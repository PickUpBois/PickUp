//
//  FindTeammatesViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine

class FindTeammatesViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var users: [SearchUsersQuery.Data.SearchUser] = [SearchUsersQuery.Data.SearchUser]()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        observeSearch()
    }
    func observeSearch() {
        $query
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                if text.isEmpty {
                    self?.users = []
                } else {
                    self?.searchUsers()
                }
            }.store(in: &cancellables)
    }
    
    private func searchUsers() {
        print("searching with text \(query)")
        Services.shared.apollo.fetch(query: SearchUsersQuery(query: query)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    self.users = []
                    return
                }
                guard let data = result.data else {
                    print("error in query")
                    self.users = []
                    return
                }
                self.users = data.searchUsers
                print(self.users)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

class MockFindTeammatesViewModel: FindTeammatesViewModel {
    override init() {
        super.init()
        self.users = [SearchUsersQuery.Data.SearchUser(id: "1", username: "Arian")]
    }
    override func observeSearch() {
        return
    }
}
