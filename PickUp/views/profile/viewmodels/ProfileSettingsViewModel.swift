//
//  ProfileSettingsViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine

class ProfileSettingsViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    @Published var username: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var college: String = ""
    
    func updateProfile() {
        let input = UpdateUserInput(firstName: !firstName.isEmpty ? firstName : nil , lastName: !lastName.isEmpty ? lastName : nil, photoUrl: nil, username: !username.isEmpty ? username : nil)
        Services.shared.apollo.perform(mutation: UpdateUserMutation(input: input)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
        Services.shared.auth.logout().sink(receiveCompletion: {completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            default:
                ()
            }
        }, receiveValue: {() in ()})
        .store(in: &self.cancellables)
    }
}

class MockProfileSettingsViewModel: ProfileSettingsViewModel {
    override func updateProfile() {
        return
    }
    
    override func logout() {
        return
    }
}

    
    
