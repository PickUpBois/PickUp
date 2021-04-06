//
//  GuestHome.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/5/21.
//

import SwiftUI

struct GuestHomeView: View {
    @ObservedObject var router: GuestRouterView.ViewModel
    var body: some View {
        Form {
            Button("Create account", action: {() in
                self.router.currentPage = .signup
            })
            Button("Login", action: {() in
                self.router.currentPage = .login
            })
        }
    }
}

struct GuestHomeView_Previews: PreviewProvider {
    static var previews: some View {
        GuestHomeView(router: GuestRouterView.ViewModel())
    }
}
