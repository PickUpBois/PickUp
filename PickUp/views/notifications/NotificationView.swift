//
//  NotificationView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/27/21.
//

import SwiftUI

struct NotificationView: View {
    var type: NotificationType
    var firstName: String
    var lastName: String
    var username: String
    var actorId: String
    var body: some View {
        FriendRequestNotificationView(id: actorId, firstName: "Arian", lastName: "Rahbar", username: "arahbar", timestamp: Date())
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(type: .friendRequestSend, firstName: "Arian", lastName: "Rahbar", username: "arahbar", actorId: "1")
    }
}
