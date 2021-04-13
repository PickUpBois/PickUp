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
            MapView()
                .tabItem {
                   Image(systemName: "location.fill")
                    Text("Map")

                }
            
            CreateEventView()
                .tabItem {
                   Image(systemName: "plus.square.fill")
                    Text("Event")
                
                }
            
            HomeView()
                .tabItem {
                   Image(systemName: "house.fill")
                    Text("Home")
    
                }
            
            ProfileView()
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
