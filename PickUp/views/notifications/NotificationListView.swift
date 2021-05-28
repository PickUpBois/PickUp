//
//  NotificationsView.swift
//  PickUp
//
//  Created by David Reynolds on 5/20/21.
//

import SwiftUI

struct NotificationListView: View {
    @State var showPopUp = false
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView{
            List(0..<self.viewModel.notifications.count) { i in
                NotificationView(id: i)
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
        NotificationListView().environmentObject(MockHomeViewModel())
    }
}
