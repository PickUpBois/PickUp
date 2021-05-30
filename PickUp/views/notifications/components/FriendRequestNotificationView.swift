//
//  FriendRequestNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct FriendRequestNotificationView: View, Identifiable {
    
    @State private var showingAlert = false
    @EnvironmentObject var viewModel: HomeViewModel
    var firstName: String
    var actorId: String
    var lastName: String
    var username: String
    var timestamp: Date
    var id: Int
    
    init(index: Int, friendRequest: GetFriendRequestsQuery.Data.User.FriendRequest) {
        self.firstName = friendRequest.user.firstName
        self.lastName = friendRequest.user.lastName
        self.id = index
        self.username = friendRequest.user.username
        self.timestamp = friendRequest.createdAt.dateFromIso!
        self.actorId = friendRequest.user.id
    }
    
    init(id: Int, notification: GetNotificationsQuery.Data.User.Notification) {
        self.id = id
        self.actorId = notification.asFriendRequest!.user.id
        self.firstName = notification.asFriendRequest!.user.firstName
        self.lastName = notification.asFriendRequest!.user.lastName
        self.username = notification.asFriendRequest!.user.username
        self.timestamp = notification.asFriendRequest!.createdAt.dateFromIso!
    }
    
    init(index: Int, actorId: String, firstName: String, lastName: String, username: String, timestamp: Date) {
        self.id = index
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.timestamp = timestamp
        self.actorId = actorId
    }
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    var body: some View {
      
        VStack{
                HStack {
                    NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(userId: self.actorId), auth: false))
                    {
                    Image("serena")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 25, height: 25, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text("\(firstName) \(lastName)")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        
                    }
                    Spacer()
                    Text(getDate(date: timestamp))
                    .lineLimit(1)
                    
                }

            Spacer().frame(height: 10)
                    HStack {
                        Text("\(firstName) \(lastName) sent you a friend request:")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 10.0)
                        Spacer().frame(minWidth: 5, maxWidth: 5)
                        
                        Button(action: {
                            self.viewModel.acceptFriendRequest(friendId: self.actorId)
                        },label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color.green)
                            .lineLimit(1)
                        })
                        
                        Button(action: {
                            self.viewModel.rejectFriendRequest(friendId: self.actorId)
                        },
                               label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color.red)
                            .lineLimit(1)
                        })
                    }
                }
                .padding(.all, 10)
                .frame(width: 400.0)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                .cornerRadius(8)
        
    }
}

struct FriendRequestNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestNotificationView(index: 0, actorId: "1", firstName: "Arian", lastName: "Rahbar", username: "arahbar", timestamp: Date()).environmentObject(MockHomeViewModel())
    }
}
