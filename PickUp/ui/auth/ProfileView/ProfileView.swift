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
            VStack {
            // Stacks everything on page
                // Stacks for profile picture
                ProfileHeaderView(showPhotoLibrary: self.$viewModel.showPhotoLibrary)
                    .frame(height: 200)


                Picker("", selection: $selection) {
                    Text("Past Pickups").foregroundColor(Color.blue).tag(1)
                    Text("Upcoming Pickups").foregroundColor(Color.red).tag(0)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)

               
                if selection == 1 {
                    PastPickupView()
                }
                //second picker option
                
                else {
                    UpcomingPickupsView(viewModel: UpcomingPickupsView.ViewModel(events: self.viewModel.upcomingEvents))
                }
                
                Spacer().frame(minHeight: 5, maxHeight: 10)
                if (viewModel.loading) {
                    Text("Loading!")
                } else {
                    Button("Logout", action: {() in
                        self.viewModel.logout()
                        })
                    }
            }
            .sheet(isPresented: self.$viewModel.showPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, userId: self.observeAuthUseCase.authUser!.id!)
                }
            .onAppear { () in
                self.viewModel.getEvents(status: .open)
                self.viewModel.getEvents(status: .closed)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("logo2")
                            .resizable()
                            .padding(.top, -15)
                            .frame(width: 125, height: 30)
                            .scaledToFit()
                        NavigationLink(destination: ProfileSettingsView()) {
                            Image(systemName: "gearshape.fill")
                            }

                    }

                }
            }
        }
        
            
    }
}


extension ProfileView {
    class ViewModel: ObservableObject {
        var authRepo: AuthRepo!
        var updateProfilePicByUrlUseCase: IUpdateProfilePictureFromExternalUrl
        var getUserEventsUseCase: IGetUserEventsByStatusUseCase
        let observeAuthUseCase = ObserveAuthState.shared
        var cancellables = Set<AnyCancellable>()
        @Published var logoutError = ""
        @Published var updateProfileError = ""
        @Published var loading = false
        @Published var imageUri: String? = nil
        @Published var textUrl: String = ""
        @Published var showPhotoLibrary = false
        @Published var upcomingEvents: [Event] = []
        @Published var pastEvents: [Event] = []
        
        init(authRepo: AuthRepo = RepoFactory.getAuthRepo(),
             updateProfilePicByUrl: IUpdateProfilePictureFromExternalUrl = UpdateProfilePictureFromExternalUrl(),
             getUserEvents: IGetUserEventsByStatusUseCase = GetUserEventsByStatusUseCase()) {
            self.authRepo = authRepo
            self.updateProfilePicByUrlUseCase = updateProfilePicByUrl
            self.getUserEventsUseCase = getUserEvents
            
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
        
        func getEvents(status: EventStatus) {
            getUserEventsUseCase.execute(userId: observeAuthUseCase.dataAuth!.id, status: status)
                .sink(receiveCompletion: {completion in
                    switch completion {
                    case .finished:
                        print("getting events successfull")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }, receiveValue: { events in
                    self.upcomingEvents = events
                }).store(in: &self.cancellables)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
            ProfileView()
        }
    }
}
