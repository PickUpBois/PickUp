//
//  Profile.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/11/21.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

/**
 Code to go inside side menu to say what each option is
 */
//struct MenuContent: View {
//    var body: some View {
//        List {
//            Text("My Profile").onTapGesture {
//                print("My Profile")
//            }
//            Text("Posts").onTapGesture {
//                print("Posts")
//            }
//            Text("Logout").onTapGesture {
//                print("Logout")
//            }
//        }
//    }
//}

/**
 SideMenu for setting
 */
//struct SideMenu: View {
//    let width: CGFloat
//    let isOpen: Bool
//    let menuClose: () -> Void
//
//    var body: some View {
//        ZStack {
//            GeometryReader { _ in
//                EmptyView()
//            }
//            .background(Color.gray.opacity(0.3))
//            .opacity(self.isOpen ? 1.0 : 0.0)
//            .animation(Animation.easeIn.delay(0.25))
//            .onTapGesture {
//                self.menuClose()
//            }
//
//            HStack {
//                MenuContent()
//                    .frame(width: self.width)
//                    .background(Color.white)
//                    .offset(x: self.isOpen ? 0 : -self.width)
//                    .animation(.default)
//
//                Spacer()
//            }
//        }
//    }
//}

struct ProfileView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selection = 1
    @State var menuOpen: Bool = false
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    
    init(viewModel: ViewModel = ViewModel()) {
        self.viewModel = viewModel
    }
    //Navigation bar
    var body: some View {
        NavigationView{
            
            
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
                
            
                Picker("", selection: $selection) {
                    Image(systemName: "circle.grid.2x2.fill").tag(0)
                    Image(systemName: "person.circle").tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                
                
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Profile").font(.headline)
//                        if !self.menuOpen {
//                            Button(action: {
//                                self.openMenu()
//                            }, label: {
//                                Text("Open")
//                            })
                        NavigationLink(destination: SignUpView()) {
                            Image(systemName: "gearshape.fill")
                            }
//                        }
                        
                    }
                    //calls the side menu
//                    SideMenu(width:270,
//                             isOpen: self.menuOpen,
//                             menuClose: self.openMenu)
                    
                }
            }
        }
        
            
        }


    // function to open the menu
//    func openMenu() {
//        self.menuOpen.toggle()
//    }
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
