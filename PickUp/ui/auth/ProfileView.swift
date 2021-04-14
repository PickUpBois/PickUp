//
//  Profile.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/11/21.
//

import SwiftUI
import Combine

struct ProfileView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = ViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if (viewModel.loading) {
            Text("Loading!")
        } else {
            Button("Logout", action: {() in
                self.viewModel.logout()
            })
        }
    }
}

extension ProfileView {
    class ViewModel: ObservableObject {
        var authRepo: AuthRepo!
        var cancellables = Set<AnyCancellable>()
        @Published var logoutError = ""
        @Published var loading = false
        
        init(authRepo: AuthRepo = RepoFactory().getAuthRepo()) {
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
