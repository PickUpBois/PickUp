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
                    Text("\(self.observeAuthUseCase.authUser?.firstName ?? "Jim")'s Profile").font(.title3) // Leading title on page
                    .fontWeight(.bold)
                    .padding(.top)
            Spacer().frame(minHeight: 10, maxHeight: 20) // Space between profile picture and leading title

                // Stacks for profile picture
                ProfileHeaderView(showPhotoLibrary: self.$viewModel.showPhotoLibrary)


                Picker("", selection: $selection) {
                    Image(systemName: "circle.grid.2x2.fill").tag(0)
                    Image(systemName: "person.circle").tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)

                    if selection == 0 {
                        Spacer()
                        HStack{Image(systemName:
                                    "circle.fill").foregroundColor(Color.green)
                            .padding(.leading, 25.0)
                            .frame(minWidth: 1, maxWidth: 10)
                                VStack{
                                Spacer()
                                    HStack{
                                        Text("W or L")
                                            .fontWeight(.heavy)
                                    Spacer().frame(minWidth: 10, maxWidth: 45)
                            Image(systemName:"calendar")
                                        Text("Date")
                                    Spacer()
                                        .frame(minWidth: 10, maxWidth: 45)
                            Image(systemName:"location.fill")
                                        Text("Location")}
                                    Image("wimby08").frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/5).clipped()
                                }.padding([.leading, .bottom, .trailing], 25.0)
                                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.5))
                                    .cornerRadius(8)
                                    .padding(.horizontal, 20)
                        }
                        }
                    //second picker option
                    else {
                    Spacer()
                    VStack{
                        HStack{
                            Image(systemName:"circle.fill")
                                .foregroundColor(Color.orange)
                                .padding(.leading, 35.0)
        .frame(minWidth: 1, maxWidth: 10)
                        HStack{
                            VStack{
                Text("Event Name")
                    .fontWeight(.heavy)
                Spacer()
                Text("Description")
                Spacer()
                Text("~~~~~~~~~~~")
                Text("~~~~~~~~~~~")
                Text("~~~~~~~~~~~")
                Spacer()
                //join event 'button'
                Text("+ Join")
                    .fontWeight(.heavy)
                    .padding(.all, 5.0)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                  }
                        Spacer()
                            VStack{
                                HStack{
                                Image(systemName:"location.fill")
                                    Text("Location")}
                            Spacer()
                                HStack{
                                Image(systemName:"calendar")
                                    Text("Date")}
                            Spacer()
                                HStack{
                                Image(systemName:"clock.fill")
                                    Text("Time")}
                            Spacer()
                                HStack{
                                Image(systemName:"person.3.fill")
                                    Text("2/4 people")}
                            Spacer()
                                Text("Invite")
                                    .fontWeight(.heavy)
                                    .padding(.all, 5.0)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                              }
                                
                                  }
                        .padding(.all, 25.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.5))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                        }
                     
                        
                        
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
                }.sheet(isPresented: self.$viewModel.showPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, userId: self.observeAuthUseCase.authUser!.id!)
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
                        NavigationLink(destination: ProfileSettingsView()) {
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
        @Published var showPhotoLibrary = false
        
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
