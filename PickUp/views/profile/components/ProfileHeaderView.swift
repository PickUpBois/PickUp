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
    let auth: Bool
    @Binding var alertType: ProfileView.AlertType?
    var body: some View {
        VStack(alignment: .center) {
            HStack{Text("\(self.profileViewModel.user?.firstName ?? "NA")'s Profile").font(.title3) // Leading title on page
            .foregroundColor(Color("Text"))
            .fontWeight(.bold)
            .padding(.top)
                
            }
            Spacer().frame(minHeight: 8, maxHeight: 8) // Space between profile
            HStack {
                VStack(alignment: .center){
                    ProfilePicture(viewModel: ProfilePictureViewModel(photoUrl: self.profileViewModel.user?.photoUrl))
                    Text("\(self.profileViewModel.user?.firstName ?? "NA") \(self.profileViewModel.user?.lastName ?? "NA")")
                        .font(.headline).fontWeight(.bold).foregroundColor(Color("Text"))
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 150, maxWidth: 1000)
                    //Text(self.profileViewModel.user?.college ?? "No College").font(.headline).fontWeight(.light).foregroundColor(Color.red).multilineTextAlignment(.center)
                        //.frame(minWidth: 150, maxWidth: 1000)
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
            
            
        HStack{
            
                NavigationLink(
                    destination:                       FriendsListView(viewModel: FriendsListViewModel(userId: self.profileViewModel.userId)),
                    label: {
            ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18){
                        
                        Button(action: {
                            
                        }) {}
                        ForEach(1...15,id: \.self){i in
                            
                            VStack{
                            Button(action: {
                            }) {
                                
                                Image("b\(i)")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 25, height: 25)
                                    .clipShape(Circle())
                            }
                            Text("1")
                                .foregroundColor(Color("Text"))
                                .font(.footnote)
                            }
                        }
                    }
            }.frame(width: .infinity)
            .padding(.horizontal, 20)
            
                    })
                
            }
            Spacer()
            
            
            }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(auth: false, alertType: .constant(nil)).environmentObject(MockProfileViewModel(userId: "1"))
    }
}
