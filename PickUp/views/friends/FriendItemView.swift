//
//  FriendItemView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/30/21.
//

import SwiftUI

struct FriendItemView: View, Identifiable {
    var id: String
    var username: String
    var body: some View {
        NavigationLink(
            destination: ProfileView(viewModel: ProfileViewModel(userId: id), auth: false),
            label: {
                Text(username)
            })
    }
}

struct FriendItemView_Previews: PreviewProvider {
    static var previews: some View {
        FriendItemView(id: "0", username: "shwinster")
    }
}
