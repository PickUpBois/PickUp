//
//  NotificationView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/27/21.
//

import SwiftUI

struct NotificationView: View, Identifiable {
    var id: Int
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        FriendRequestNotificationView(notification: viewModel.notifications[id])
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(id: 1).environmentObject(MockHomeViewModel())
    }
}
