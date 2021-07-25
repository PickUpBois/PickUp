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
    enum State {
        case idle
        case loading
        case success
        case error(Error)
    }
    @Published var state: State = .idle
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
        state = .loading
        Services.shared.apollo.fetch(query: SearchUsersQuery(search: query)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    self.users = []
                    self.state = .error(errors[0])
                    return
                }
                self.users = result.data?.searchUsers ?? []
                self.state = .success
                print(self.users)
            case .failure(let error):
                print(error.localizedDescription)
                self.state = .error(error)
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
