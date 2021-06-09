//
//  FinishPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/24/21.
//

import SwiftUI

struct FinishPickupView: View {
    var arrayOfNames = ["Arian", "David", "Ashwin", "Jimmy"]
    @State private var selectedIndex = 0
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
            }
            
            Spacer().frame(height: 10)
            
            //Adding Picture and Public/Private Stack
            HStack{
            Text("Vote for MVP:")
                .font(.subheadline)
                .fontWeight(.bold)
            Spacer().frame(width: 5)
                Picker("Names", selection: $selectedIndex) {
                    ForEach(viewModel.event!.attendees.indices, id: \.self) { i in
                        Text(viewModel.event!.attendees[i].fragments.userDetails.firstName)
                                   }
                    .pickerStyle(WheelPickerStyle())
                           }

                .frame(width: 300.0, height: 175.0)
            }
            
        }
                
        
        Spacer()
        
        }
}

struct FinishPickupView_Previews: PreviewProvider {
    static var previews: some View {
        FinishPickupView(viewModel: MockNotificationViewModel())
    }
}
