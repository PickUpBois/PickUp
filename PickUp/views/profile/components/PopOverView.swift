//
//  SwiftUIView.swift
//  PickUp
//
//  Created by David Reynolds on 6/14/21.
//

import SwiftUI

struct PopOverView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        
        VStack(alignment: .center, spacing: 18) {
            
            Button(action:{
                if self.viewModel.user?.friendStatus == .friend {
                    self.viewModel.removeFriend()
                } else {
                    self.viewModel.addFriend()
                }
            }) {
                if self.viewModel.user?.friendStatus == .friend {
                    Text("Remove Friend")
                        .foregroundColor(Color("Text"))
                } else {
                    Text("Add Friend")
                        .foregroundColor(Color("Text"))
                }
            }
            
            Divider()
            Button(action:{
            }) {
                    Text("Block")
                        .foregroundColor(Color("Text"))
            }
            
            Divider()
            Button(action:{
                }) {
                    Text("Report")
                        .foregroundColor(Color("Text"))
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
        PopOverView().environmentObject(MockProfileViewModel(userId: "1"))
    }
}
