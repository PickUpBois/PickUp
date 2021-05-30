//
//  FriendRequestAcceptNotificationView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/30/21.
//

import SwiftUI

struct FriendRequestAcceptNotificationView: View {
    var id: Int
    var actorId: String
    var firstName: String
    var lastName: String
    var username: String
    var timestamp: Date
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack{
                HStack {
                    NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(userId: actorId), auth: false)) {
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
            Spacer().frame(height: 15)
                    HStack {
                        Text("\(firstName) \(lastName) accepted your friend request")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 10.0)
                            .frame(width: 400, alignment: .leading)
                    }
                }
                .padding(.all, 10)
                .frame(width: 400.0)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                .cornerRadius(8)
    }
}

struct FriendRequestAcceptNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestAcceptNotificationView(id: 0, actorId: "1", firstName: "John", lastName: "Cena", username: "John", timestamp: Date())
    }
}
