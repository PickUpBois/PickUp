//
//  ProfilePictureViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/20/21.
//

import Foundation
import Combine

class ProfilePictureViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var selectedImage: Data? = nil
    @Published var loading: Bool = false
    @Published var photoUrl: String?
    
    init(photoUrl: String?) {
        self.photoUrl = photoUrl
    }
    func uploadPhoto() {
        let path = "profilePictures/\(AppState.shared.authId!).jpg"
        loading = true
        Services.shared.storage.upload(file: selectedImage!, path: path).sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("uploaded image")
            }
        }, receiveValue: { downloadUrl in
            let input = UpdateUserInput(college: nil, firstName: nil, lastName: nil, photoUrl: downloadUrl, username: nil)
            Services.shared.apollo.perform(mutation: UpdateUserMutation(input: input)) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0].localizedDescription)
                    }
                    self.loading = false
                    self.photoUrl = downloadUrl
                case .failure(let error):
                    print(error.localizedDescription)
                }

            }}).store(in: &self.cancellables)
    }
}

class MockProfilePictureViewModel: ProfilePictureViewModel {
    override func uploadPhoto() {
        return
    }
}
