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
    @Binding var showPhotoLibrary: Bool
    let firstName: String
    let lastName: String
    let username: String
    let college: String?
    let photoUrl: String?
    let auth: Bool
    @EnvironmentObject var profileViewModel: ProfileViewModel
    init(user: GetUserQuery.Data.User?, showPhotoLibrary: Binding<Bool>, auth: Bool) {
        self.firstName = user?.firstName ?? "NA"
        self.lastName = user?.lastName ?? "NA"
        self.username = user?.username ?? "NA"
        self.college = user?.college
        self.photoUrl = user?.photoUrl
        self._showPhotoLibrary = showPhotoLibrary
        self.auth = auth
    }
    @State private var showingAlert = false
    var body: some View {
        VStack(alignment: .center) {
            HStack{Text("\(firstName)'s Profile").font(.title3) // Leading title on page
            .fontWeight(.bold)
            .padding(.top)
           
                //not following yet
                if !auth {
                    Button(action: {},
                           label: {Image(systemName: "plus.square.fill")
                            .foregroundColor(Color.red)
                            .padding(.top)
                           })
                            
                   //if following, click to unfollow
                    Button(action: {
                        self.showingAlert = true
                    },label: {
                        Image(systemName: "checkmark.square.fill")
                                .foregroundColor(Color.green)
                                .padding(.top)
                            .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Confirm Unfollow!"), message: Text("Are you sure you want to remove Arian as a teammate?"), primaryButton: .default(Text("Yes")) {
                                    print("Yeah")
                            }, secondaryButton: .destructive(Text("Cancel")))
                        }
                    })
                    
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
                        ProfilePicture(photoUrl: self.photoUrl)
                    }
                    Text("\(firstName) \(lastName)")
                        .font(.headline).fontWeight(.bold).foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 150, maxWidth: 1000)
                    Text(college ?? "No College").font(.headline).fontWeight(.light).foregroundColor(Color.red).multilineTextAlignment(.center)
                        .frame(minWidth: 150, maxWidth: 1000)
                    Spacer()
                        //Space between profile picture center of page
                }
                .frame(width: 100.0)
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
        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: GetUserQuery.Data.User(id: "1", firstName: "Ashwin", lastName: "Reynolds", username: "Arahbar", college: "ISU Cyclones"), showPhotoLibrary: .constant(false), auth: false).environmentObject(MockProfileViewModel(userId: "1"))
    }
}
