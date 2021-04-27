//
//  Profile.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/11/21.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ViewModel
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    
    init(viewModel: ViewModel = ViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if (observeAuthUseCase.authUser != nil) {
            print("photoUrl: \(observeAuthUseCase.authUser!.photoUrl)")
        }
        return VStack {
            if observeAuthUseCase.authUser != nil {
                Text(observeAuthUseCase.authUser!.firstName)
                Text(observeAuthUseCase.authUser!.lastName)
            } else {
                Image("Logo")
            }
            TextField("Image url", text: $viewModel.textUrl)
            Button("Update Picture", action: { () in viewModel.updateProfilePicByUrl(userId: observeAuthUseCase.authUser!.id!)})
            Button("Logout", action: {() in
                self.viewModel.logout() 
            })
        }
    }
}

extension ProfileView {
    class ViewModel: ObservableObject {
        var authRepo: AuthRepo!
        var updateProfilePicByUrlUseCase: IUpdateProfilePictureFromExternalUrl
        var cancellables = Set<AnyCancellable>()
        @Published var logoutError = ""
        @Published var updateProfileError = ""
        @Published var loading = false
        @Published var imageUri: String? = nil
        @Published var textUrl: String = ""
        
        init(authRepo: AuthRepo = RepoFactory.getAuthRepo(),
             updateProfilePicByUrl: IUpdateProfilePictureFromExternalUrl = UpdateProfilePictureFromExternalUrl()) {
            self.authRepo = authRepo
            self.updateProfilePicByUrlUseCase = updateProfilePicByUrl
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
        
        func updateProfilePicByUrl(userId: String) {
            updateProfilePicByUrlUseCase.execute(url: textUrl, userId: userId)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .finished:
                        print("successfully updated profile picture")
                    }
                }, receiveValue: { downloadUrl in
                    self.imageUri = downloadUrl
                }).store(in: &cancellables)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
