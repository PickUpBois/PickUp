//
//  ProfileSettingsView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/30/21.
//

import SwiftUI
import Combine

struct ProfileSettingsView: View {
    @ObservedObject var viewModel: ProfileSettingsViewModel
    @EnvironmentObject var userViewModel: ProfileViewModel
    init(viewModel: ProfileSettingsViewModel = ProfileSettingsViewModel()) {
        self.viewModel = viewModel
    }
    @State private var updateProfileAlert = false
    @State private var logoutAlert = false
    @State private var showingAlert = false
    var body: some View {
        TextField("username", text: $viewModel.username)
        TextField("first name", text: $viewModel.firstName)
        TextField("last name", text: $viewModel.lastName)
        TextField("college", text: $viewModel.college)
        Text("\(userViewModel.user?.firstName ?? "Jim")")
        Text("\(userViewModel.user?.lastName ?? "Jimmy")")
        Text("\(userViewModel.user?.username ?? "username")")
        
        Button(action: {
            self.updateProfileAlert = true
        },label: {
            Text("Update Profile")
                .foregroundColor(Color.green)
                .padding(.top)
                .alert(isPresented:$updateProfileAlert) {
                    Alert(title: Text("Confirm Profile Update"), message: Text("Are you sure you want to update your profile to these changes?"), primaryButton: .default(Text("Yes")) {
                        self.viewModel.updateProfile()
                    }, secondaryButton: .destructive(Text("Cancel")))
                }})
       
        Button(action: {
            self.logoutAlert = true
            },label: {
            Text("Logout")
                .foregroundColor(Color.green)
                .padding(.top)
                .alert(isPresented:$logoutAlert) {
                    Alert(title: Text("Confirm Sign Out"), message: Text("Are you sure you want to log out?"), primaryButton: .default(Text("Yes")) {
                        () in
                        self.viewModel.logout()
                    }, secondaryButton: .destructive(Text("Cancel")))
                }})
        

    }
}



struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView(viewModel: MockProfileSettingsViewModel()).environmentObject(MockProfileViewModel(userId: "1"))
    }
}

