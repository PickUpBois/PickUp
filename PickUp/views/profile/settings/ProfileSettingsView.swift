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
    @State private var logoutAlert = false
    @State private var showingAlert = false
    //@Environment(\.colorScheme) var colorscheme
    var body: some View {
        VStack{
            List {
                    Button(action:{
                    }) {
                        SettingsFields(title: "Account", imgName: "person.circle.fill")
                            .foregroundColor(Color("Text"))
                            
                }
                    Button(action:{
                    }) {
                        SettingsFields(title: "Privacy", imgName: "lock.fill")
                            .foregroundColor(Color("Text"))
                }
                    Button(action:{
                    }) {
                        SettingsFields(title: "Security", imgName: "shield.lefthalf.fill")
                            .foregroundColor(Color("Text"))
                }
                    Button(action:{
                    }) {
                    SettingsFields(title: "Notifications", imgName: "bell.circle.fill")
                        .foregroundColor(Color("Text"))
                }
                    Button(action:{
                    }) {
                        //Link to app Store
                        SettingsFields(title: "Write a Review", imgName: "pencil.and.outline")
                            .foregroundColor(Color("Text"))
                }
                    Button(action:{
                    }) {
                        //Share through messaging/snapchat, etc..
                        SettingsFields(title: "Tell Your Friends", imgName: "gift")
                            .foregroundColor(Color("Text"))
                }
                    Button(action:{
                    }) {
                        //Text Field with Send Button
                        SettingsFields(title: "Suggest a Feature", imgName: "star.circle")
                            .foregroundColor(Color("Text"))
                }
                    Button(action:{
                    }) {
                        //Text Field with Send Button
                        SettingsFields(title: "Report a Bug", imgName: "questionmark.circle.fill")
                            .foregroundColor(Color("Text"))
                }
                    Button(action:{
                    }) {
                        //Text Field with Send Button
                        SettingsFields(title: "About", imgName: "info.circle.fill")
                            .foregroundColor(Color("Text"))
                }
                    Button(action:{
                        self.logoutAlert = true
                    }) {
                    //Text Field with Send Button
                    SettingsFields(title: "Logout", imgName: "exclamationmark.triangle")
                        .foregroundColor(Color.red)
                        .alert(isPresented:$logoutAlert) {
                            Alert(title: Text("Confirm Sign Out"), message: Text("Are you sure you want to log out?"), primaryButton: .default(Text("Yes")) {
                                () in
                                self.viewModel.logout()
                            }, secondaryButton: .destructive(Text("Cancel")))
                        }
                    }
            }
            .listStyle(SidebarListStyle())
            .environment(\.horizontalSizeClass, .regular)
    
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 0.0) {
                        Text("Settings")
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Text"))
                
            }
        }
}
        
}
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView(viewModel: MockProfileSettingsViewModel()).environmentObject(MockProfileViewModel(userId: "1"))
    }
}

