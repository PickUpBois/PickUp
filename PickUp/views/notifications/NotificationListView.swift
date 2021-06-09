//
//  NotificationsView.swift
//  PickUp
//
//  Created by David Reynolds on 5/20/21.
//

import SwiftUI

struct NotificationListView: View {
    @State var showPopUp = false
    @ObservedObject var viewModel: NotificationListViewModel
    init(viewModel: NotificationListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        List(self.viewModel.notifications.indices, id: \.self) { i in
            let notificationViewModel = self.viewModel.notifications[i]
            switch self.viewModel.notifications[i].type {
            case .friendRequestSend:
                FriendRequestNotificationView(viewModel: notificationViewModel)
            case .friendRequestAccept:
                FriendRequestResponseNotificationView(viewModel: notificationViewModel)
            case .friendRequestReject:
                FriendRequestResponseNotificationView(viewModel: notificationViewModel)
            case .finishEvent:
                FinishPickupNotificationView(viewModel: notificationViewModel)
            case .voteForMvp:
                ConfirmationNotificationView(viewModel: notificationViewModel)
            default:
                Text("error")
            }
        }
        .onAppear {
            self.viewModel.getNotifications()
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
        NotificationListView(viewModel: MockNotificationListViewModel())
    }
}
