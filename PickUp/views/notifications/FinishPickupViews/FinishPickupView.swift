//
//  FinishPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/24/21.
//

import SwiftUI

struct FinishPickupView: View {
    @State private var selectedIndex = 0
    @Binding var showPopUp: Bool
    let viewModel: NotificationViewModel

    var body: some View {
        Spacer().frame(height: 10)
        
        VStack (alignment: .leading){
            //Name Stack
            HStack {
                Image("serena")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 25, height: 25, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                
                Text("Ashwin Yedavalli")
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Text"))
                    .lineLimit(1)
            }
            
            Spacer().frame(height: 10)
            
            //Adding Picture and Public/Private Stack
            HStack{
            Text("MVP:")
                .font(.subheadline)
                .fontWeight(.bold)
            Spacer().frame(width:20)
                Picker("Names", selection: $selectedIndex) {
                    ForEach(viewModel.event!.attendees.indices, id: \.self) { i in
                        Text(viewModel.event!.attendees[i].fragments.attendeeDetails.user.fragments.userDetails.firstName)
                                   }
                    .pickerStyle(WheelPickerStyle())
                           }

                .frame(width: 270, height: 120.0)
            }
            
            
            Button(action: {
                let eventId = self.viewModel.event!.id
                let voteeId = self.viewModel.event!.attendees[selectedIndex].fragments.attendeeDetails.user.fragments.userDetails.id
                self.viewModel.voteForMvp(eventId: eventId, voteeId: voteeId)
                showPopUp = false
            }) {
                
                HStack{
                Text("Vote")
                    .foregroundColor(.white)
                }
                
            }.frame(alignment: .center)
            .padding(.horizontal, 160)
            .padding(.vertical, 10)
            .background(Color.blue)
            .cornerRadius(10)
        }
        }
}

struct FinishPickupView_Previews: PreviewProvider {
    static var previews: some View {
        FinishPickupView(showPopUp: .constant(false), viewModel: MockNotificationViewModel())
    }
}
