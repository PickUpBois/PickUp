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
    
    var body: some View {
        TextField("username", text: $viewModel.username)
        TextField("first name", text: $viewModel.firstName)
        TextField("last name", text: $viewModel.lastName)
        TextField("college", text: $viewModel.college)
        Text("\(userViewModel.user?.firstName ?? "Jim")")
        Text("\(userViewModel.user?.lastName ?? "Jimmy")")
        Text("\(userViewModel.user?.username ?? "username")")
        
        Button("Update profile", action: {self.viewModel.updateProfile()})
    }
}



struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView(viewModel: MockProfileSettingsViewModel()).environmentObject(MockProfileViewModel(userId: "1"))
    }
}

