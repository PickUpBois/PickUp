//
//  EventInvitationNotificationView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/5/21.
//

import SwiftUI

struct EventInvitationNotificationView: View {
    
    @State private var showingAlert = false
    @EnvironmentObject var viewModel: HomeViewModel
    var firstName: String
    var actorId: String
    var lastName: String
    var username: String
    var timestamp: Date
    var id: Int
    var eventId: String
    
    init(id: Int, notification: GetNotificationsQuery.Data.User.Notification) {
        self.id = id
        self.actorId = notification.actor!.id
        self.firstName = notification.actor!.firstName
        self.lastName = notification.actor!.lastName
        self.username = notification.actor!.username
        self.timestamp = notification.createdAt.dateFromIso!
        self.eventId = notification.event!.fragments.eventDetails.id
    }
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    init(index: Int, actorId: String, firstName: String, lastName: String, username: String, timestamp: Date, eventId: String) {
        self.id = index
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.timestamp = timestamp
        self.actorId = actorId
        self.eventId = eventId
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
                        Text("\(firstName) \(lastName) invited you to their event:")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 10.0)
                        Spacer().frame(minWidth: 5, maxWidth: 5)
                        
                        Button(action: {
                            self.viewModel.acceptEventInvitation(eventId: eventId)
                        },label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color.green)
                            .lineLimit(1)
                        })
                        
                        Button(action: {
                            self.viewModel.declineEventInvitation(eventId: eventId)
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

struct EventInvitationNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        EventInvitationNotificationView(index: 0, actorId: "1", firstName: "Arian", lastName: "Rahbar", username: "arahbar", timestamp: Date(), eventId: "1").environmentObject(MockHomeViewModel())
    }
}
