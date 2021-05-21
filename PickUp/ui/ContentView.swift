//
//  ContentView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
        var body: some View {
            Group {
                // if the user is logged in
                if observeAuthUseCase.dataAuth != nil {
                    MainView()
                        .onAppear { observeAuthUseCase.refreshUser() }
                } else {
                    NavigationView {
                        LoginView()
                    }
                }
            }.onAppear(perform: {
                observeAuthUseCase.listen()
            })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
