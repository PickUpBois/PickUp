//
//  ProfileHeaderView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/1/21.
//

import SwiftUI

enum ProfileAlertType {
    case none
    case unfollowAlert
    case followAlert
}

struct ProfileHeaderView: View {
    @State var showPopUp = false
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @Binding var showPhotoLibrary: Bool
    let auth: Bool
    @State private var showingUnfollowAlert = false
    @State private var showingFollowAlert = false
    init(showPhotoLibrary: Binding<Bool>, auth: Bool) {
        self._showPhotoLibrary = showPhotoLibrary
        self.auth = auth
    }
    var body: some View {
        VStack(alignment: .center) {
            HStack{Text("\(self.profileViewModel.user?.firstName ?? "NA")'s Profile").font(.title3) // Leading title on page
            .fontWeight(.bold)
            .padding(.top)
                
                //not following yet
                if !auth {
                    if self.profileViewModel.user?.friendStatus == nil {
                        Button(action: {
                            self.showingFollowAlert = true
                        },
                               label: {Image(systemName: "plus.square.fill")
                                .foregroundColor(Color.red)
                                .padding(.top)
                                .alert(isPresented: $showingFollowAlert) {
                                    Alert(title: Text("Confirm Follow!"), message: Text("Are you sure you want to add \(self.profileViewModel.user?.firstName ?? "NA") as a teammate?"), primaryButton: .default(Text("Yes")) {
                                        self.profileViewModel.addFriend()
                                    }, secondaryButton: .destructive(Text("Cancel")))
                                }
                               })
                    } else {
                        //if following, click to unfollow
                         Button(action: {
                             self.showingUnfollowAlert = true
                         },label: {
                             Image(systemName: "checkmark.square.fill")
                                     .foregroundColor(Color.green)
                                     .padding(.top)
                                 .alert(isPresented: $showingUnfollowAlert) {
                                     Alert(title: Text("Confirm Unfollow!"), message: Text("Are you sure you want to remove \(self.profileViewModel.user?.firstName ?? "NA") as a teammate?"), primaryButton: .default(Text("Yes")) {
                                        self.profileViewModel.removeFriend()
                                 }, secondaryButton: .destructive(Text("Cancel")))
                             }
                         })
                    }
                    
                }
                
                //Text("Add")
                    //.font(.title3)
                    //.padding(.top)
                
            }
            
            Spacer().frame(minHeight: 8, maxHeight: 8) // Space between profile
            HStack {
                VStack(alignment: .center){
                    Button(action: {
//                        IN PROGRESS
//                        self.showPhotoLibrary = true
                        print("image was tapped")
                    }) {
                        ProfilePicture(photoUrl: self.profileViewModel.user?.photoUrl)
                    }
                    Text("\(self.profileViewModel.user?.firstName ?? "NA") \(self.profileViewModel.user?.lastName ?? "NA")")
                        .font(.headline).fontWeight(.bold).foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 150, maxWidth: 1000)
                    Text(self.profileViewModel.user?.college ?? "No College").font(.headline).fontWeight(.light).foregroundColor(Color.red).multilineTextAlignment(.center)
                        .frame(minWidth: 150, maxWidth: 1000)
                    Spacer()
                        //Space between profile picture center of page
                }
                .frame(width: 100.0)
                VStack {
                Text("Total").font(.headline).foregroundColor(Color.black)
                Text("Pickups").font(.headline).foregroundColor(Color.black)
                    Text("\(self.profileViewModel.pastEvents.count)").font(.title).fontWeight(.bold)
                    Spacer()
                }
                VStack {
                   
                    NavigationLink(
                        destination: FriendsListView(viewModel: FriendsListViewModel(userId: self.profileViewModel.userId)),
                        label: {
                            VStack{
                                Text("Team").font(.headline).foregroundColor(Color.black)
                                Text("Members").font(.headline).foregroundColor(Color.black)
                                Text("\(self.profileViewModel.user?.friends.count ?? 0)").font(.title).fontWeight(.bold).foregroundColor(Color.black)
                                
                                Spacer()
                            }
                        })
                }

                VStack {
                Text("GOAT").font(.headline).foregroundColor(Color.black)
                Text("Meter").font(.headline).foregroundColor(Color.black)
                    Spacer().frame(height: 8)
               ZStack(alignment: .leading){
                    Capsule().frame(width: 50, height: 20)
                        .foregroundColor(.blue)
                    Capsule().frame(width: 20, height: 20)
                        .foregroundColor(.green)
                    }
                    Spacer()
                }
                }
            }
        }
    }



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(showPhotoLibrary: .constant(false), auth: false).environmentObject(MockProfileViewModel(userId: "1"))
    }
}
