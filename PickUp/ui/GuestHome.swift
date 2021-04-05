//
//  GuestHomeView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/5/21.
//

import SwiftUI
import Combine

struct GuestHomeView: View {
    @EnvironmentObject var router: ContentView.ViewModel
    var body: some View {
        Button("Create account", action: {() in
            router.currentPage = .signup
        })
        Button("Login", action: {() in
            router.currentPage = .login
        })
    }
}

extension GuestHomeView {
    class ViewModel: ObservableObject {
        var authRepo: AuthRepo!
        
        init(authRepo: AuthRepo = ViewModelFactory().getAuthRepo()) {
            self.authRepo = authRepo
        }
    }
}

struct GuestHomeView_Previews: PreviewProvider {
    static var previews: some View {
        GuestHomeView()
    }
}
