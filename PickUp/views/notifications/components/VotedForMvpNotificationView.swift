//
//  VotedForMvpNotificationView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/13/21.
//

import SwiftUI

struct VotedForMvpNotificationView: View {
    var viewModel: NotificationViewModel
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    init(viewModel: NotificationViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack{
                HStack {
//                    NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(userId: viewModel.actor!.id), auth: false)) {
//                    Image("serena")
//                        .resizable()
//                        .foregroundColor(.blue)
//                        .frame(width: 25, height: 25, alignment: .center)
//                        .clipShape(Circle())
//                        .shadow(radius: 2)
//                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
//                    
//                        Text("\(viewModel.actor!.firstName) \(viewModel.actor!.lastName)")
//                        .fontWeight(.heavy)
//                        .foregroundColor(Color.black)
//                        .lineLimit(1)
//                        
//                    }
                    Spacer()
                    Text(getDate(date: viewModel.timestamp))
                    .lineLimit(1)
                    
                }
            Spacer().frame(height: 15)
                    HStack {
                        Text("You have been voted MVP!")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 10.0)
                            .frame(width: 400, alignment: .leading)
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

struct VotedForMvpNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        VotedForMvpNotificationView(viewModel: MockNotificationViewModel())
    }
}