//
//  MainView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelection = 1
    @State private var tappedTwice: Bool = false
    @State var show = false
    
            @State private var home = UUID()
            @State private var teammates = UUID()
            @State private var event = UUID()
            @State private var nearme = UUID()
            @State private var profile = UUID()
    
    var body: some View {
        var handler: Binding<Int> { Binding(
                get: { self.tabSelection },
                set: {
                    if $0 == self.tabSelection {
                        // Lands here if user tapped more than once
                        tappedTwice = true
                    }
                    self.tabSelection = $0
                }
        )}
        return TabView(selection: handler) {
            //Home Tab
            NavigationView {
                HomeView(viewModel: HomeViewModel())
                    .id(home)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    home = UUID()
                    self.tappedTwice = false
            })
            }
            .tabItem {
               Image(systemName: "house.fill")
                Text("Home")
                
            }.tag(1)
            
            //Map Tab
            NavigationView {
                FindTeammatesView()
                    .id(teammates)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    teammates = UUID()
                    self.tappedTwice = false
                    
            })
            }
            .tabItem {
               Image(systemName: "magnifyingglass")
                Text("Search")
               
            }.tag(2)

            //Event Tab
            NavigationView {
                CreateEventView()
                    .id(event)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    event = UUID()
                    self.tappedTwice = false
                    
            })
            }
            .tabItem {
               Image(systemName: "plus.square.fill")
                Text("Event")
                
            }.tag(3)
            
            //NearMe Tab
            NavigationView {
                NearMeView()
                    .id(nearme)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    nearme = UUID()
                    self.tappedTwice = false
            })
            }
            .tabItem {
               Image(systemName: "mappin.and.ellipse")
                Text("NearMe")
                
            }.tag(4)
            
            //Profile Tab
            NavigationView {
                ProfileView(viewModel: ProfileViewModel(userId: AppState.shared.authId!), auth: true)
                    .id(profile)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    profile = UUID()
                    self.tappedTwice = false
            })
            }
            .tabItem {
               Image(systemName: "person.fill")
                Text("Profile")
                
            }.tag(5)
            
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(named: "Tabbar")
            
        }
        .accentColor(.green)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()

    }
}
