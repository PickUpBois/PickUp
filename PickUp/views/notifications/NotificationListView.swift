//
//  NotificationsView.swift
//  PickUp
//
//  Created by David Reynolds on 5/20/21.
//

import SwiftUI

struct NotificationListView: View {
    @State var showPopUp = false
    @ObservedObject var viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView {
            ForEach(self.viewModel.notifications.indices, id: \.self) { i in
                switch self.viewModel.notifications[i].type {
                case .friendRequestSend:
                    FriendRequestNotificationView(id: i, notification: self.viewModel.notifications[i]).environmentObject(self.viewModel)
                case .friendRequestAccept:
                    FriendRequestResponseNotificationView(id: i, response: .accept, notification: self.viewModel.notifications[i]).environmentObject(self.viewModel)
                case .friendRequestReject:
                    FriendRequestResponseNotificationView(id: i, response: .reject, notification: self.viewModel.notifications[i]).environmentObject(self.viewModel)
                case .finishEvent:
                    FinishPickupNotificationView(id: i, notification: self.viewModel.notifications[i]).environmentObject(self.viewModel)
                default:
                    FriendRequestNotificationView(id: i, notification: self.viewModel.notifications[i]).environmentObject(self.viewModel)
                }
            }
        }
        .frame(width: .infinity, height: .infinity, alignment: .topLeading)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    Text("Notifications")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}


struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView(viewModel: MockHomeViewModel())
    }
}
