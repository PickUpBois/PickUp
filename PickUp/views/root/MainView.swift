//
//  MainView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            
            FindTeammatesView()
                .tabItem {
                   Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search")
                    
                }
            MapMainView()
                .tabItem {
                   Image(systemName: "location.fill")
                    Text("Map")
                   
                }

            
            CreateEventView()
                .tabItem {
                   Image(systemName: "plus.square.fill")
                    Text("Event")
                
                }
            
            HomeView(viewModel: HomeViewModel())
                .tabItem {
                   Image(systemName: "house.fill")
                    Text("Home")
    
                }
            
            ProfileView(viewModel: ProfileViewModel(userId: AppState.shared.authId!), auth: true)
                .tabItem {
                   Image(systemName: "person.fill")
                    Text("Profile")
                    
                }
            
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(.green)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()

    }
}
