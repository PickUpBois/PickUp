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
        
        VStack(alignment: .center, spacing: 18) {
            
            Button(action:{
                if self.viewModel.user?.friendStatus == .friend {
                    alertType = .removeFriend
                } else {
                    alertType = .addFriend
                }
            }) {
                if self.viewModel.user?.friendStatus == .friend {
                    Text("Remove Friend")
                } else {
                    Text("Add Friend")
                }
            }
            
            Divider()
            Button(action:{
            }) {
                    Text("Block")
            }
            
            Divider()
            Button(action:{
                }) {
                    Text("Report")
            }
            
        }
        .foregroundColor(.black)
        .frame(width: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
}
}

struct PopOverView_Previews: PreviewProvider {
    static var previews: some View {
        PopOverView(alertType: .constant(nil)).environmentObject(MockProfileViewModel(userId: "1"))
    }
}
