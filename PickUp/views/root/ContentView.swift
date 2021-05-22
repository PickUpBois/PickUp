//
//  ContentView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var appState: AppState = AppState.shared
        var body: some View {
            Group {
                // if the user is logged in
                if appState.authId != nil {
                    MainView().onAppear(perform: {
                        appState.listen()
                    })
                } else {
                    NavigationView {
                        LoginView()
                            .onAppear(perform: {
                                appState.detach()
                            })
                    }
                }
            }.onAppear(perform: {
                appState.authId = Services.shared.auth.getCurrentUser()
            })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
