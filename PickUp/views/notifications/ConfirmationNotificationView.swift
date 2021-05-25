//
//  ConfirmationNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct ConfirmationNotificationView: View {
    @State var showPopUp = false
    var body: some View {
      
        VStack{
        HStack {
            NavigationLink(destination: ProfileView(viewModel: MockProfileViewModel(userId: "1"), auth: true)) {
            Image("serena")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 25, height: 25, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 2)
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            
            Text("David Reynolds")
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .lineLimit(1)
            }
            Spacer()
            Text("5/21/2021 @ 7:00 P.M.")
            .lineLimit(1)
                
            }
            Spacer().frame(height: 10)
                HStack{
                    Button(action: {
                        self.showPopUp.toggle()
                    },label: {
                        Text("David has entered a score of 21-19 (W) for the event '2v2 Pickup at Lied Rec. Press here to confirm score and finish Pickup!")
                            .foregroundColor(Color.purple)
                            .padding(.leading, 10.0)
                            .lineLimit(3)
                    })
                }.sheet(isPresented: $showPopUp, content: {
                    
                    FinishPickupView()
                    
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
                    //Spacer().frame(height: 300)
                })
        }
            .padding(.all, 10)
            .frame(width: 400.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
        
    }
}

struct ConfirmationNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationNotificationView()
    }
}
