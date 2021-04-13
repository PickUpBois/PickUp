//
//  HomeView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import SwiftUI
import Combine

struct AuthTabView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = ViewModelFactory().getAuthTabViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            AuthHomeView()
                .tabItem {
                    Text("Home")
                }.tag(AuthViews.home)
            ProfileView()
                .tabItem {
                    Text("Profile")
                }.tag(AuthViews.profile)
        }
    }
}

enum AuthViews {
    case home
    case profile
}

extension AuthTabView {
    class ViewModel: ObservableObject {
        var authRepo: AuthRepo!
        var cancellables = Set<AnyCancellable>()
        @Published var logoutError = ""
        @Published var loading = false
        @Published var selection: AuthViews = AuthViews.home
        
        init(authRepo: AuthRepo = ViewModelFactory().getAuthRepo()) {
            self.authRepo = authRepo
        }
        
        func logout() {
            self.authRepo.logout().sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error):
                    self.logoutError = error.localizedDescription
                default:
                    ()
                }
            }, receiveValue: {() in ()})
            .store(in: &self.cancellables)
        }
    }
}

struct AuthTabView_Previews: PreviewProvider {
    static var previews: some View {
        AuthTabView()
    }
}
