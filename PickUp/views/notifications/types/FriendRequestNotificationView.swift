//
//  FriendRequestNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FriendRequestNotificationView: View {
    
    @State private var showingAlert = false
    let viewModel: NotificationViewModel
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    var body: some View {
      
        VStack{
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(userId: viewModel.actor!.id), auth: false))
                        {
//                            WebImage(url: URL(string: viewModel.actor?.photoUrl ?? ""))
//                                .placeholder(Image("serena")
//                                                .resizable())
//                                .resizable()
//                                .foregroundColor(.blue)
//                                .frame(width: 25, height: 25, alignment: .center)
//                                .clipShape(Circle())
//                                .shadow(radius: 2)
//                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            if viewModel.actor!.photoUrl != nil {
                                WebImage(url: URL(string: viewModel.actor!.photoUrl ?? ""))
                                    .resizable()
                                    .placeholder {
                                        Rectangle()
                                            .foregroundColor(.gray)
                                        }
                                    .indicator(.activity)
                                    .foregroundColor(.blue)
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .clipShape(Circle())
                                    .shadow(radius: 2)
                                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                    .padding()
                            } else {
                                Image("placeholder")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .clipShape(Circle())
                                    .shadow(radius: 2)
                                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                    .padding()
                            }
                        
                            Text("\(viewModel.actor!.firstName) \(viewModel.actor!.lastName)")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("Text"))
                            .lineLimit(1)
                            
                        }
                    })
                    Spacer()
                    Text(getDate(date: viewModel.timestamp))
                    .lineLimit(1)
                    
                }

            Spacer().frame(height: 10)
                    HStack {
                        Text("\(viewModel.actor!.firstName) \(viewModel.actor!.lastName) sent you a friend request:")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 10.0)
                        Spacer().frame(minWidth: 5, maxWidth: 5)
                        
                        Button(action: {
                            self.viewModel.acceptFriendRequest(friendId: viewModel.actor!.id)
                        },label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color.green)
                            .lineLimit(1)
                        })
                        
                        Button(action: {
                            self.viewModel.rejectFriendRequest(friendId: viewModel.actor!.id)
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
    static let actor = UserDetails(id: "1", firstName: "1", lastName: "last", username: "username")
    static var previews: some View {
        FriendRequestNotificationView(viewModel: MockNotificationViewModel())
    }
}
