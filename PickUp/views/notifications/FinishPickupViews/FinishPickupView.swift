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
        Spacer().frame(height: 20)
        
        VStack (alignment: .leading){
            //Name Stack
            HStack {
                Image("serena")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 25, height: 25, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                
                Text("Ashwin Yedavalli")
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .lineLimit(1)
                    .padding(.top, 20)
            }
            
            Spacer().frame(height: 10)
            
            //Adding Picture and Public/Private Stack
            HStack{
            Text("Vote for MVP:")
                .font(.subheadline)
                .fontWeight(.bold)
            Spacer().frame(width: 15)
                Picker("Names", selection: $selectedIndex) {
                    ForEach(viewModel.event!.attendees.indices, id: \.self) { i in
                        Text(viewModel.event!.attendees[i].fragments.userDetails.firstName)
                                   }
                    .pickerStyle(WheelPickerStyle())
                           }

                .frame(width: 270, height: 120.0)
            }
            Button(action: {
                let eventId = self.viewModel.event!.id
                let voteeId = self.viewModel.event!.attendees[selectedIndex].fragments.userDetails.id
                self.viewModel.voteForMvp(eventId: eventId, voteeId: voteeId)
            }) {
                Text("Vote")
            }
        }
        }
}

struct FinishPickupView_Previews: PreviewProvider {
    static var previews: some View {
        FinishPickupView(showPopUp: .constant(false), viewModel: MockNotificationViewModel())
    }
}
