//
//  VoteForMvpNotificationView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/8/21.
//

import SwiftUI

struct VoteForMvpNotificationView: View {
    @Binding var showPopUp: Bool
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
                    Spacer()
                    Text(getDate(date: viewModel.event!.startDate.dateFromIso!))
                    .lineLimit(1)
                        
                    }
                    Spacer().frame(height: 10)
                        HStack{
                            NavigationLink(destination: FinishPickupView(viewModel: viewModel)) {
                                Text("Press here to vote for mvp for event '\(viewModel.event!.name)'")
                                    .foregroundColor(Color.purple)
                                    .frame(width: 400, alignment: .leading)
                                    .lineLimit(3)
                            }
                            
                        }
                }
                    .padding(.all, 10)
        .frame(width: 400.0)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(8)
    }
}

struct VoteForMvpNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        VoteForMvpNotificationView(showPopUp: .constant(false), viewModel: MockNotificationViewModel())
    }
}
