//
//  NotificationsView.swift
//  PickUp
//
//  Created by David Reynolds on 5/20/21.
//

import SwiftUI

struct NotificationListView: View {
    @State var showPopUp = false
    var notificationIndex: Int
    var body: some View {
        ScrollView{
            VStack {
                EditedPickupNotificationView()
                
                FriendRequestNotificationView(id: "1", firstName: "Arian", lastName: "Rahbar", username: "arahbar", timestamp: Date())
                
                ConfirmationNotificationView()
                
                FinishPickupNotificationView()
                
                PostNotificationView()
                
                
            }.frame(width: .infinity, height: .infinity, alignment: .topLeading)
            
        }        .navigationBarTitleDisplayMode(.inline)
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
        NotificationListView(notificationIndex: 1)
    }
}
