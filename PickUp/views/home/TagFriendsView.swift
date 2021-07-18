//
//  TagFriendsView.swift
//  PickUp
//
//  Created by David Reynolds on 7/18/21.
//

import SwiftUI

struct TagFriendsView: View {
    var body: some View {
        FriendsListView(viewModel: MockFriendsListViewModel(userId: "1"))
        
        Text("Need your firends with a circle icon next to them for tagging")
        Spacer()
    }
}

struct TagFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        TagFriendsView()
    }
}
