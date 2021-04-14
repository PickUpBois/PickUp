//
//  ContentView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    /// EnvironmentObject representing the user's session that constantly listens for changes in auth state
    @EnvironmentObject var session: Session
    
    /// starts listening to the session so that it knows when the user is logged in or out
    func listen() {
        session.listen()
    }
        var body: some View {
            Group {
                // if the user is logged in
                if session.authUser != nil {
                    MainView()
                } else {
                    NavigationView {
                        LoginView()
                    }
                }
            }.onAppear(perform: listen)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Session())
    }
}
