//
//  AuthHome.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/11/21.
//

import SwiftUI
import Combine

struct AuthHomeView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = ViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

extension AuthHomeView {
    class ViewModel: ObservableObject {
        var authRepo: AuthRepo!
        var cancellables = Set<AnyCancellable>()
        @Published var logoutError = ""
        @Published var loading = false
        @Published var selection: AuthViews = AuthViews.profile
        
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

struct AuthHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHomeView()
    }
}
