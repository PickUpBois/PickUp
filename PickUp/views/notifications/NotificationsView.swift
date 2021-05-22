//
//  NotificationsView.swift
//  PickUp
//
//  Created by David Reynolds on 5/20/21.
//

import SwiftUI

struct NotificationsView: View {
    @State var showPopUp = false
    var body: some View {
        NavigationView {
        ScrollView{
            VStack {

                EditedPickupNotificationView()
                
                FriendRequestNotificationView()
                
                ConfirmationNotificationView()
                
                FinishPickupNotificationView()
                
            }.frame(width: .infinity, height: .infinity, alignment: .topLeading)
        }
            
            
            
                }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    Text("Notifications")
                        .fontWeight(.heavy)

                }
            }
        }
    }
}


struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}