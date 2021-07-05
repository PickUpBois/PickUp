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
    var body: some View {
        
        VStack{
            List {
                    Button(action:{
                    }) {
                        SettingsFields(title: "Account", imgName: "person.circle.fill", clr: .green)
                }
                    Button(action:{
                    }) {
                        SettingsFields(title: "Privacy", imgName: "lock.fill", clr: .green)
                }
                    Button(action:{
                    }) {
                        SettingsFields(title: "Security", imgName: "shield.lefthalf.fill", clr: .green)
                }
                    Button(action:{
                    }) {
                    SettingsFields(title: "Notifications", imgName: "bell.circle.fill", clr: .green)
                }
                    Button(action:{
                    }) {
                        //Link to app Store
                        SettingsFields(title: "Write a Review", imgName: "pencil.and.outline", clr: .green)
                }
                    Button(action:{
                    }) {
                        //Share through messaging/snapchat, etc..
                        SettingsFields(title: "Tell Your Friends", imgName: "gift", clr: .green)
                }
                    Button(action:{
                    }) {
                        //Text Field with Send Button
                        SettingsFields(title: "Suggest a Feature", imgName: "star.circle", clr: .green)
                }
                    Button(action:{
                    }) {
                        //Text Field with Send Button
                        SettingsFields(title: "Report a Bug", imgName: "exclamationmark.triangle", clr: .green)
                }
                    Button(action:{
                    }) {
                        //Text Field with Send Button
                        SettingsFields(title: "About", imgName: "info.circle.fill", clr: .green)
                }
                    Button(action:{
                        self.logoutAlert = true
                    }) {
                    //Text Field with Send Button
                    SettingsFields(title: "Logout", imgName: "arrow.down.right.circle.fill", clr: .red)
                        .alert(isPresented:$logoutAlert) {
                            Alert(title: Text("Confirm Sign Out"), message: Text("Are you sure you want to log out?"), primaryButton: .default(Text("Yes")) {
                                () in
                                self.viewModel.logout()
                            }, secondaryButton: .destructive(Text("Cancel")))
                        }
                    }
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
        
//                    Button(action: {
//                        self.logoutAlert = true
//                        },label: {
//                            Text("Logout")
//                                .foregroundColor(Color.red)
//                                .padding(.all)
//                                .alert(isPresented:$logoutAlert) {
//                                    Alert(title: Text("Confirm Sign Out"), message: Text("Are you sure you want to log out?"), primaryButton: .default(Text("Yes")) {
//                                        () in
//                                        self.viewModel.logout()
//                                    }, secondaryButton: .destructive(Text("Cancel")))
//                                }})
//            Spacer().frame(height: 200)
    
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

