//
//  ProfileSettingsView.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/30/21.
//

import SwiftUI
import Combine

struct ProfileSettingsView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    
    var body: some View {
        TextField("username", text: $viewModel.username)
        TextField("first name", text: $viewModel.firstName)
        TextField("last name", text: $viewModel.lastName)
        TextField("college", text: $viewModel.college)
        
        Button("Update profile", action: {self.viewModel.updateProfile(userId: observeAuthUseCase.authUser!.id!)})
    }
}

extension ProfileSettingsView {
    class ViewModel: ObservableObject {
        let updateProfileUseCase: IUpdateProfileUseCase
//        var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
        var cancellables = Set<AnyCancellable>()
        init(updateProfileUseCase: IUpdateProfileUseCase = UpdateProfileUseCase()) {
            self.updateProfileUseCase = updateProfileUseCase
        }
        
        @Published var username: String = ""
        @Published var firstName: String = ""
        @Published var lastName: String = ""
        @Published var college: String = ""
        
        func updateProfile(userId: String) {
            var fields : [ ProfileField: Any? ] = [:]
            if !username.isEmpty {
                fields[.username] = username
            }
            if !firstName.isEmpty {
                fields[.firstName] = firstName
            }
            if !lastName.isEmpty {
                fields[.lastName] = lastName
            }
            if !college.isEmpty {
                fields[.college]  =  college
            }
            updateProfileUseCase.execute(userId: userId, fields: fields)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case  .failure(let error):
                        print(error.localizedDescription)
                    case .finished:
                        print("successfully updated profile")
                    }
                }, receiveValue: {})
                .store(in: &cancellables)
            
        }
        
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
