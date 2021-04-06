//
//  GuestHomeView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/5/21.
//

import SwiftUI
import Combine

struct GuestRouterView: View {
    @ObservedObject var router: ViewModel = ViewModel()
    
    init(viewModel: ViewModel = ViewModel()) {
        self.router = viewModel
    }
    var body: some View {
        NavigationView {
            VStack {
                Navigator.navigate(route: .signup, content: {Text("Create account")})
                Navigator.navigate(route: .login, content: {Text("Login")})
            }
        }
    }
}

enum GuestPage {
    case home
    case signup
    case login
}

extension GuestRouterView {
    class ViewModel: ObservableObject {
        @Published var currentPage: GuestPage = .home
    }
}

struct GuestRouterView_Previews: PreviewProvider {
    static var previews: some View {
        GuestRouterView()
    }
}
