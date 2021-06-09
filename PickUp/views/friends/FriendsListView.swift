//
//  FriendsListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/30/21.
//

import SwiftUI

struct FriendsListView: View {
    @ObservedObject var viewModel: FriendsListViewModel
    init(viewModel: FriendsListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView{
        VStack {
            Text("Friends")
            Spacer().frame(height: 20)
            ScrollView {
                ForEach(self.viewModel.friends, id: \.self.id) { user in
                    FriendItemView(id: user.id, username: user.username).frame(width: 300)
                }
            }
        }.onAppear(perform: {
            self.viewModel.getFriends()
        })
        }.navigationTitle("Teammates")
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(viewModel: MockFriendsListViewModel(userId: "1"))
    }
}
