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
            .foregroundColor(Color("Text"))
            .fontWeight(.bold)
            .padding(.top)
                
            }
            let _ = print("user at header: \(profileViewModel.user)")
            Spacer().frame(minHeight: 8, maxHeight: 8) // Space between profile
            HStack {
                VStack(alignment: .center){
                    Button(action: {
                        self.showPhotoLibrary = true
                        print("image was tapped")
                    }) {
                        ProfilePicture(photoUrl: self.profileViewModel.user?.photoUrl)
                    }
                    Text("\(self.profileViewModel.user?.firstName ?? "NA") \(self.profileViewModel.user?.lastName ?? "NA")")
                        .font(.headline).fontWeight(.bold).foregroundColor(Color("Text"))
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 150, maxWidth: 1000)
                    Text(self.profileViewModel.user?.college ?? "No College").font(.headline).fontWeight(.light).foregroundColor(Color.red).multilineTextAlignment(.center)
                        .frame(minWidth: 150, maxWidth: 1000)
                    Spacer()
                        //Space between profile picture center of page
                }
                .frame(width: 100.0)
                VStack {
                Text("Total").font(.headline).foregroundColor(Color("Text"))
                Text("Pickups").font(.headline).foregroundColor(Color("Text"))
                    Text("\(self.profileViewModel.pastEvents.count)").font(.title).fontWeight(.bold)
                    Spacer()
                }
                VStack {
                   
                    NavigationLink(
                        destination: FriendsListView(viewModel: FriendsListViewModel(userId: self.profileViewModel.userId)),
                        label: {
                            VStack{
                                Text("Team").font(.headline).foregroundColor(Color("Text"))
                                Text("Members").font(.headline).foregroundColor(Color("Text"))
                                Text("\(self.profileViewModel.user?.friends.count ?? 0)").font(.title).fontWeight(.bold).foregroundColor(Color("Text"))
                                
                                Spacer()
                            }
                        })
                }

                VStack {
                Text("GOAT").font(.headline)
                    .lineLimit(1)
                    .foregroundColor(Color("Text"))
                Text("Meter").font(.headline)
                    .lineLimit(1)
                    .foregroundColor(Color("Text"))
                    Spacer().frame(height: 8)
               ZStack(alignment: .leading){
                    Capsule().frame(width: 40, height: 20)
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
