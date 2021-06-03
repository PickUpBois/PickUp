//
//  FinishPickupNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct FinishPickupNotificationView: View {
    @State var showPopUp = false
    var body: some View {
        VStack{
                HStack {
                    NavigationLink(destination: ProfileView(viewModel: MockProfileViewModel(userId: "1"), auth: true)) {
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
                    }
                    Spacer()
                    Text("5/22/2021 @ 8:00 P.M.")
                    .lineLimit(1)
                        
                    }
                    Spacer().frame(height: 10)
                        HStack{
                            Button(action: {
                                self.showPopUp.toggle()
                            },label: {
                                Text("Press here to enter score for your event 'Doubles match'")
                                    .foregroundColor(Color.purple)
                                    .frame(width: 400, alignment: .leading)
                                    .lineLimit(3)
                            })
                            
                        }.sheet(isPresented: $showPopUp, content: {
                            
                            InputScoreView()
                            
                            Button(action: {},
                                   label: {
                                    Text("Finish Pickup")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.pink/*@END_MENU_TOKEN@*/.opacity(0.8))
                                    .cornerRadius(9)
                                    .padding(.all, 20)
                                    
                                   })
                            
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
                            Spacer().frame(height: 300)
                            .background(BackgroundClearView())
                        })
                }
                    .padding(.all, 10)
        .frame(width: 400.0)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(8)
        
    }
}

struct FinishPickupNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        FinishPickupNotificationView()
    }
}
