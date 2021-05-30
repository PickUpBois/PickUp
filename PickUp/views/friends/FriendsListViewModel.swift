//
//  FriendsListViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/30/21.
//

import Foundation

class FriendsListViewModel: ObservableObject {
    @Published var friends: [GetFriendsQuery.Data.User.Friend] = []
    var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func getFriends() {
        print("getting friends")
        Services.shared.apollo.fetch(query: GetFriendsQuery(userId: userId), cachePolicy: .fetchIgnoringCacheCompletely) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                guard let data = result.data else {
                    print("error in getting friends")
                    return
                }
                self.friends = data.user.friends
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

class MockFriendsListViewModel: FriendsListViewModel {
    override init (userId: String) {
        let user = GetFriendsQuery.Data.User.Friend(id: "1", username: "shwinster", firstName: "David", lastName: "Rahbar")
        super.init(userId: userId)
        self.friends = [user]
    }
    
    override func getFriends() {
        let user = GetFriendsQuery.Data.User.Friend(id: "1", username: "shwinster", firstName: "David", lastName: "Rahbar")
        self.friends = [user]
    }
}
