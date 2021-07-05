//
//  JoinedEventNotificationView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/25/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct JoinedEventNotificationView: View {
    var viewModel: NotificationViewModel
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    var body: some View {
        VStack{
                HStack {
                    NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(userId: viewModel.actor!.id), auth: false)) {
//                        WebImage(url: URL(string: viewModel.actor?.photoUrl ?? ""))
//                            .placeholder(Image("serena")
//                                            .resizable())
//                            .resizable()
//                            .indicator(.activity)
//                            .foregroundColor(.blue)
//                            .frame(width: 25, height: 25, alignment: .center)
//                            .clipShape(Circle())
//                            .shadow(radius: 2)
//                             .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
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
                                .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                        } else {
                            Image("placeholder")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 25, height: 25, alignment: .center)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                        }
                    
                        Text("\(viewModel.actor!.firstName) \(viewModel.actor!.lastName)")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                        
                    }
                    Spacer()
                    Text(getDate(date: viewModel.timestamp))
                    .lineLimit(1)
                    
                }
            Spacer().frame(height: 10)
                    HStack {
                        Text("\(viewModel.actor!.firstName) \(viewModel.actor!.lastName) has joined your event \(viewModel.event!.name)")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 12.0)
                            .frame(width: 380, alignment: .leading)
                    }
            Spacer().frame(height: 15)
            HStack(alignment: .lastTextBaseline) {
                Button(action: {
                    self.viewModel.readNotification(id: viewModel.notificationId)
                }, label: {
                    Text("Mark as read")
                })
            }
                }
                .padding(.all, 10)
                .frame(width: 400.0)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                .cornerRadius(8)
    }
}

struct JoinedEventNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        JoinedEventNotificationView(viewModel: MockNotificationViewModel())
    }
}
