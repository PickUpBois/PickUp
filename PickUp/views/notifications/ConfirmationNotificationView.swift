//
//  ConfirmationNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct ConfirmationNotificationView: View {
    var body: some View {
      
        VStack{
        HStack {
            Image("serena")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 25, height: 25, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 2)
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            
            Button(action: {
            },label: {
            Text("David Reynolds")
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .lineLimit(1)
            })
            Spacer()
            Text("5/21/2021 @ 7:00 P.M.")
            .lineLimit(1)
                
            }
            Spacer().frame(height: 10)
            HStack {
                HStack{
                    Button(action: {
                    },label: {
                        Text("David has entered a score of 21-19 (W) for the event '2v2 Pickup at Lied Rec. Press here to confirm score and finish Pickup!")
                            .foregroundColor(Color.purple)
                            .padding(.leading, 10.0)
                            .lineLimit(3)
                    })
                }
        }
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
