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
    //Navigation bar
    var body: some View {
        ScrollView {
        // Stacks everything on page
        VStack(alignment: .center) {
            Text("Jim's Profile").font(.title3) // Leading title on page
                .fontWeight(.bold)
                .padding(.top)
        Spacer().frame(minHeight: 10, maxHeight: 20) // Space between profile picture and leading title
            
            // Stacks for profile picture
            HStack {
                VStack{
                Image("Jim").frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 2)
                .overlay(Circle().stroke(Color.black, lineWidth: 5))
                    .padding(.trailing, 20)
                    Text("Jim Heise").font(.headline).fontWeight(.bold).foregroundColor(Color.black)
                    Text("Cyclones").font(.headline).fontWeight(.light).foregroundColor(Color.red)
                Spacer()//Space between profile picture center of page
            }
                VStack {
                Text("Total").font(.headline).foregroundColor(Color.black)
                Text("Pickups").font(.headline).foregroundColor(Color.black)
                    Text("50").font(.title).fontWeight(.bold)
                    Spacer()
                }
                VStack {
                Text("Team").font(.headline).foregroundColor(Color.black)
                Text("Members").font(.headline).foregroundColor(Color.black)
                    Text("50").font(.title).fontWeight(.bold)
                    Spacer()
                }
                VStack {
                Text("GOAT").font(.headline).foregroundColor(Color.black)
                Text("Meter").font(.headline).foregroundColor(Color.black)
                Image(systemName: "battery.25").font(.system(size: 40))
                    .foregroundColor(.green)
                    Spacer()
                }
            }
            
        Spacer().frame(minHeight: 140, maxHeight: 800)
        if (viewModel.loading) {
            Text("Loading!")
        } else {
            Button("Logout", action: {() in
                self.viewModel.logout()
                })
            }
        }
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
