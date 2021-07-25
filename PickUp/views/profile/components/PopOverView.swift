//
//  SwiftUIView.swift
//  PickUp
//
//  Created by David Reynolds on 6/14/21.
//

import SwiftUI

struct PopOverView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @Binding var alertType: ProfileView.AlertType?
    var body: some View {
        
        VStack(alignment: .center){
            
            Button(action:{
                if self.viewModel.user?.friendStatus == true {
                    alertType = .removeFriend
                } else {
                    alertType = .addFriend
                }
            }) {
                Group {
                    if self.viewModel.user?.friendStatus == true {
                        Text("Remove Friend")
                            .foregroundColor(Color("Text"))
                            .frame(width: 380)
                            .padding(.horizontal)
                            .padding(.vertical, 15)
                            .background(Color("DescriptionEvent"))
                            .cornerRadius(20)
                    }
                    
                    else {
                        Text("Add Friend")
                            .foregroundColor(Color("Text"))
                            .frame(width: 380)
                            .padding(.horizontal)
                            .padding(.vertical, 15)
                            .background(Color("DescriptionEvent"))
                            .cornerRadius(20)
                    }
                }
            }
            
            Button(action:{
            }) {
                    Text("Message")
                        .foregroundColor(Color("Text"))
                        .frame(width: 380)
                        .padding(.horizontal)
                        .padding(.vertical, 15)
                        .background(Color("DescriptionEvent"))
                        .cornerRadius(20)
            }

            Button(action:{
            }) {
                    Text("Block")
                        .foregroundColor(Color("Text"))
                        .frame(width: 380)
                        .padding(.horizontal)
                        .padding(.vertical, 15)
                        .background(Color("DescriptionEvent"))
                        .cornerRadius(20)
            }

            
            Button(action:{
                }) {
                    Text("Report")
                        .foregroundColor(Color("Text"))
                        .frame(width: 380)
                        .padding(.horizontal)
                        .padding(.vertical, 15)
                        .background(Color("DescriptionEvent"))
                        .cornerRadius(20)
            }

            
        }
        .background(Color("Tabbar").opacity(0.1))
        .padding(.bottom, 10)
}
}

struct PopOverView_Previews: PreviewProvider {
    static var previews: some View {
        PopOverView(alertType: .constant(nil)).environmentObject(MockProfileViewModel(userId: "1"))
    }
}
