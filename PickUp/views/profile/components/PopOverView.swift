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
                if self.viewModel.user?.friendStatus == .friend {
                    alertType = .removeFriend
                } else {
                    alertType = .addFriend
                }
            }) {
                if self.viewModel.user?.friendStatus == .friend {
                    Text("Remove Friend")
                        .foregroundColor(Color("Text"))
                        .padding(.horizontal, 124)
                        .padding(.vertical, 15)
                        .background(Color.red).opacity(0.9)
                        .cornerRadius(20)
                }
                
                else {
                    Text("Add Friend")
                        .foregroundColor(Color("Text"))
                        .padding(.horizontal, 139)
                        .padding(.vertical, 15)
                        .background(Color.blue).opacity(0.9)
                        .cornerRadius(20)
                }
            }
            
            Button(action:{
            }) {
                    Text("Message")
                        .foregroundColor(Color("Text"))
            }
            .padding(.horizontal, 146)
            .padding(.vertical, 15)
            .background(Color.blue).opacity(0.9)
            .cornerRadius(20)

            
            Button(action:{
            }) {
                    Text("Block")
                        .foregroundColor(Color("Text"))
            }.padding(.horizontal, 158)
            .padding(.vertical, 15)
            .background(Color.blue).opacity(0.9)
            .cornerRadius(20)

            
            Button(action:{
                }) {
                    Text("Report")
                        .foregroundColor(Color("Text"))
            }.padding(.horizontal, 153)
            .padding(.vertical, 15)
            .background(Color.blue).opacity(0.9)
            .cornerRadius(20)
            
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
