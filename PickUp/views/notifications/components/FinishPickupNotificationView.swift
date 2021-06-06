//
//  FinishPickupNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct FinishPickupNotificationView: View {
    @State var showPopUp = false
    @State private var showingAlert = false
    @EnvironmentObject var viewModel: HomeViewModel
    var firstName: String
    var actorId: String
    var lastName: String
    var username: String
    var timestamp: Date
    var id: Int
    var eventId: String
    var eventName: String
    @State var team1Members: [String] = []
    @State var team2Members: [String] = []
    @State var team1Scores: [Int] = []
    @State var team2Scores: [Int] = []
    @State var team1Win: Bool = false
    @State var team2Win: Bool = false
    
    init(id: Int, notification: GetNotificationsQuery.Data.User.Notification) {
        self.id = id
        self.actorId = notification.actor!.id
        self.firstName = notification.actor!.firstName
        self.lastName = notification.actor!.lastName
        self.username = notification.actor!.username
        self.timestamp = notification.createdAt.dateFromIso!
        self.eventId = notification.event!.fragments.eventDetails.id
        self.eventName = notification.event!.fragments.eventDetails.name
    }
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    init(index: Int, actorId: String, firstName: String, lastName: String, username: String, timestamp: Date, eventId: String, eventName: String) {
        self.id = index
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.timestamp = timestamp
        self.actorId = actorId
        self.eventId = eventId
        self.eventName = eventName
    }
    
    var body: some View {
        VStack{
                HStack {
                    NavigationLink(destination: ProfileView(viewModel: MockProfileViewModel(userId: "1"), auth: true)) {
                    Image("logo2")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 25, height: 25, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text("PickUp")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                    }
                    Spacer()
                    Text(getDate(date: timestamp))
                    .lineLimit(1)
                        
                    }
                    Spacer().frame(height: 10)
                        HStack{
                            Button(action: {
                                self.showPopUp.toggle()
                            },label: {
                                Text("Press here to enter score for your event '\(eventName)'")
                                    .foregroundColor(Color.purple)
                                    .frame(width: 400, alignment: .leading)
                                    .lineLimit(3)
                            })
                            
                        }.sheet(isPresented: $showPopUp, content: {
                            
                            InputScoreView(id: self.id)
                            
                            Button(action: {},
                                   label: {
                                    Text("Finish Pickup")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.pink/*@END_MENU_TOKEN@*/.opacity(0.8))
                                    .cornerRadius(9)
                                    .padding(.all, 20)
                                    
                                   })
                            
                            Button(action: {
                                self.showPopUp.toggle()
                            },label: {
                                Text("Dismiss")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(Color.black.opacity(0.8))
                                    .cornerRadius(9)
                                    .padding(.horizontal, 20)
                            })
                            Spacer().frame(height: 300)
                            .background(BackgroundClearView())
                        })
                }
                    .padding(.all, 10)
        .frame(width: 400.0)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(8)
        
    }
}

struct FinishPickupNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        FinishPickupNotificationView(index: 0, actorId: "1", firstName: "Arian", lastName: "Rahbar", username: "arahbar", timestamp: Date(), eventId: "1", eventName: "name").environmentObject(MockHomeViewModel())
    }
}
