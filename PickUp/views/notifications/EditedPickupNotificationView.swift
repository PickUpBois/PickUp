//
//  EditedPickupNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct EditedPickupNotificationView: View {
    @State private var showingAlert = false
    var body: some View {
       
        VStack{
            HStack {
                NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(userId: "1"), auth: true)) {
                Image("serena")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 25, height: 25, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                
                Text("Ashwin Yedavalli")
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Text"))
                    .lineLimit(1)
                }
                
                Spacer()
                Text("11/05/2021 @ 11:45 P.M.")
                .lineLimit(1)
                    
                }
                    Spacer().frame(height: 10)
            
                HStack {
                    Text("Ashwin's event location was moved from Los Angeles, California to Las Vegas, Nevada")
                        .foregroundColor(Color.purple)
                        .frame(width: 400, alignment: .leading)
                    
                }
            Spacer().frame(height: 10)
            
                HStack{
                    Button(action: {},
                           label: {
                    Text("Accept Changes")
                        .foregroundColor(.green)
                    Spacer().frame(width: 3)
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.green)
                        .lineLimit(1)
                    })
                    
                    Spacer().frame(width: 15)
                    
                    Button(action: {
                        self.showingAlert = true
                    },label: {
                        HStack{Text("Leave Pickup:")
                            .foregroundColor(.red)
                        Spacer().frame(width: 3)
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color.red)
                            .lineLimit(1)}
                            .alert(isPresented:$showingAlert) {
                                Alert(title: Text("Leave PickUp?"), message: Text("Are you sure you want to leave this PickUp?"), primaryButton: .default(Text("Yes")) {
                                    
                                    print("Cool beans. Check it out later.")
                                    
                                }, secondaryButton: .destructive(Text("Cancel")))
                            }})

                }
            }
                .padding(.all, 10)
        .frame(width: 400.0, height: 150.0)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                .cornerRadius(8)
    }
}

struct EditedPickupNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        EditedPickupNotificationView()
    }
}
