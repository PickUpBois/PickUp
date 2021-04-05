//
//  HomeView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import SwiftUI
import Combine

struct AuthHomeView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = ViewModelFactory().getAuthHomeViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button("Logout", action: {() in
            self.viewModel.logout()
        })
    }
}

extension AuthHomeView {
    class ViewModel: ObservableObject {
        var authRepo: AuthRepo!
        var cancellables = Set<AnyCancellable>()
        @Published var logoutError = ""
        
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
