//
//  ContentView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
        var body: some View {
            switch viewModel.currentPage {
            case .signup:
                SignUpView()
            case .login:
                LoginView()
            case .authHome:
                AuthHomeView()
            case .guestHome:
                GuestHomeView()
            case .none:
                Text("Hello")
            }
    }
}

enum Page {
    case signup
    case login
    case authHome
    case guestHome
}

extension ContentView {
    class ViewModel: ObservableObject {
        var authRepo: AuthRepo!
        var authUser: CurrentValueSubject<String?, Never>!
        private var cancellables = Set<AnyCancellable>()
        @Published var currentPage: Page!
        init(authRepo: AuthRepo = ViewModelFactory().getAuthRepo()) {
            self.authRepo = authRepo
            authRepo.observeAuthState().sink(receiveValue: {userId in
                if userId != nil {
                    self.currentPage = .authHome
                } else {
                    self.currentPage = .guestHome
                }
            }).store(in: &cancellables)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
