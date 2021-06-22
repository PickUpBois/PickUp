//
//  Profile.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/11/21.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

extension ProfileView {
    enum AlertType {
        case addFriend
        case removeFriend
    }
}


struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    @State private var selection = 1
    @State var menuOpen: Bool = false
    @State var popover = false
    @State var alertType: AlertType? = nil
    @State var photoSelectionMode: UIImagePickerController.SourceType = .photoLibrary
    var auth: Bool
    //Navigation bar
    
    var addFriendAlert: Alert {
        Alert(title: Text("Add Friend"), message: Text("Send friend request to \(viewModel.user?.username ?? "NA")?"), primaryButton: .default(Text("Yes")) {
            self.viewModel.addFriend()
            self.alertType = nil
        }, secondaryButton: .destructive(Text("No")) {
            self.alertType = nil
        })
    }
    
    var removeFriendAlert: Alert {
        Alert(title: Text("Remove Friend"), message: Text("Remove \(viewModel.user?.username ?? "NA") as friend?"), primaryButton: .default(Text("Yes")) {
            self.viewModel.removeFriend()
            self.alertType = nil
        }, secondaryButton: .destructive(Text("No")) {
            self.alertType = nil
        })
    }
    
    var body: some View {
        let showAlert: Binding<Bool> = .init(get: {self.alertType != nil}, set: {_ in })
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.retrieveState)
        case .loading:
            ProgressView()
        default:
            VStack {
            // Stacks everything on page
                // Stacks for profile picture
                ProfileHeaderView(auth: auth, alertType: $alertType).environmentObject(self.viewModel)
                    .frame(height: 200)


                Picker("", selection: $selection) {
                    Text("Past Pickups").foregroundColor(Color.blue).tag(1)
                    Text("Upcoming Pickups").foregroundColor(Color.red).tag(0)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)

               
                if selection == 1 {
                    PastPickupView().environmentObject(viewModel)
                }
                //second picker option
                
                else {
                    UpcomingPickupsView().environmentObject(viewModel)
                }
                
                
                Spacer().frame(minHeight: 5, maxHeight: 10)
                
                //popover for unfriending, blocking, and reporting
                    
                if popover == true{
            
                    PopOverView(alertType: $alertType).environmentObject(self.viewModel)
                    
                }
            }
            .alert(isPresented: showAlert) {
                switch alertType! {
                case .addFriend:
                    return self.addFriendAlert
                case .removeFriend:
                    return self.removeFriendAlert
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        
                        if auth {
                            
                            Spacer().frame(minWidth: 55.5, idealWidth: 55.5, maxWidth: 55.5, alignment: .center)
                            Image("logo")
                                .resizable()
                                .padding(.top, -5)
                                .frame(width: 130, height: 40)
                                .scaledToFit()
                            
                            Spacer().frame(minWidth: 107, idealWidth: 107, maxWidth: 107, alignment: .center)
                            NavigationLink(destination: ProfileSettingsView().environmentObject(self.viewModel)) {
                                Image(systemName: "gearshape.fill").resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                                    .foregroundColor(Color.green)
                                    .frame(width: 25.0, height: 25.0)
                                    .padding(.trailing, 5)
                                
                            }
                        }
                        
                        else{
                            
                            Spacer().frame(minWidth: 10.5, idealWidth: 10.5, maxWidth: 10.5, alignment: .center)
                            Image("logo")
                                .resizable()
                                .padding(.top, -5)
                                .frame(width: 130, height: 40)
                                .scaledToFit()
                            
                            Spacer().frame(minWidth: 107, idealWidth: 107, maxWidth: 107, alignment: .center)
                            Button( action: {
                                withAnimation(.easeIn){popover.toggle()}

                            }, label: {
                                Image(systemName: "square.and.arrow.up.fill")
                                    .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                                    .foregroundColor(Color.green)
                                    .frame(width: 20.0, height: 25.0)
                            })
                        }
                        
                    }
                    .padding(.leading, 81.5)
                }
            }
            
        }
            
    }
    
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: MockProfileViewModel(userId: "1"), auth: true)
    }
}
