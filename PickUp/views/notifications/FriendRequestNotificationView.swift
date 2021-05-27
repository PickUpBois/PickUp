//
//  FriendRequestNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct FriendRequestNotificationView: View {
    @State private var showingAlert = false
    var body: some View {
      
        VStack{
                HStack {
                    NavigationLink(destination: ProfileView(viewModel: MockProfileViewModel(userId: "1"), auth: true))
                    {
                    Image("serena")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 25, height: 25, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    
                    Text("Arian Rahbar")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        
                    }
                    Spacer()
                    Text("12/11/2020 @ 1:45 A.M.")
                    .lineLimit(1)
                    
                }

            Spacer().frame(height: 10)
                    HStack {
                        Text("Arian Rahbar sent you a friend request:")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 10.0)
                        Spacer().frame(minWidth: 5, maxWidth: 5)
                        
                        Button(action: {
                            self.showingAlert = true
                        },label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color.green)
                            .lineLimit(1)
                        })
                        
                        Button(action: {
                            
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
        FriendRequestNotificationView()
    }
}
