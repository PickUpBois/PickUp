//
//  NotificationsView.swift
//  PickUp
//
//  Created by David Reynolds on 5/20/21.
//

import SwiftUI

struct NotificationsView: View {
    @State var showPopUp = false
    var body: some View {
        NavigationView {
        ScrollView{
            VStack (spacing: 5) {
                VStack{
                HStack {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(.blue)
                        .padding(.leading, 5.0)
                    
                    Button(action: {
                        self.showPopUp.toggle()
                    },label: {
                    Text("Ashwin Yedavall")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                    })
                    
            
                    Spacer()
                    Text("11/05/2021 @ 11:45 P.M.")
                    .lineLimit(1)
                        
                    }
                    Spacer()
                    HStack {
                        Text("Ashwin's event location was moved from Los Angeles, California to Las Vegas, Nevada")
                            .foregroundColor(Color.purple)
                            .padding(.leading, 10.0)
                            .lineLimit(2)
                    
                }
                }
                .padding(.all, 10)
                .frame(width: 400.0)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                .cornerRadius(8)
                
                VStack{
                HStack {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(.blue)
                        .padding(.leading, 5.0)
                    
                    Button(action: {
                        self.showPopUp.toggle()
                    },label: {
                    Text("Arian Rahbar")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        
                    })
                    Spacer()
                    Text("12/11/2020 @ 1:45 A.M.")
                    .lineLimit(1)
                    
                }
                    Spacer()
                    HStack {
                        Text("Arian Rahbar sent you a friend request...")
                            .foregroundColor(Color.purple)
                            .lineLimit(1)
                            .padding(.leading, 10.0)
                        Spacer().frame(minWidth: 5, maxWidth: 5)
                        
                        Button(action: {
                            self.showPopUp.toggle()
                        },label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color.green)
                            .lineLimit(1)
                        })
                        
                        Button(action: {
                            self.showPopUp.toggle()
                        },label: {
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
            
            
            
                }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    Text("Notifications")
                        .fontWeight(.heavy)

                }
            }
        }
    }
}


struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
