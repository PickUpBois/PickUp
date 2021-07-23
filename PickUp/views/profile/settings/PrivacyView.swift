//
//  PrivacyView.swift
//  PickUp
//
//  Created by David Reynolds on 7/22/21.
//

import SwiftUI

struct PrivacyView: View {
    @ObservedObject var viewModel: ProfileSettingsViewModel
    @EnvironmentObject var userViewModel: ProfileViewModel
    init(viewModel: ProfileSettingsViewModel = ProfileSettingsViewModel()) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack{
                List {
                    Button(action:{
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                    }) {
                    SettingsFields(title: "Location Services", imgName: "location.fill")
                        .foregroundColor(Color("Text"))
                        }
                    
                    Button(action:{
                        
                    }) {
                    SettingsFields(title: "Blocked Account", imgName: "person.crop.circle.fill.badge.exclamationmark")
                        .foregroundColor(Color("Text"))
                        }
                    
                }
                .listStyle(SidebarListStyle())
                .environment(\.horizontalSizeClass, .regular)
                .onAppear {
                    UITableView.appearance().isScrollEnabled = false
                }
        }
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
