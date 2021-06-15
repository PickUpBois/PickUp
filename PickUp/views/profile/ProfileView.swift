//
//  Profile.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/11/21.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI


struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var selection = 1
    @State var menuOpen: Bool = false
    @State var popover = false
    var auth: Bool
    init(viewModel: ProfileViewModel, auth: Bool) {
        self.viewModel = viewModel
        self.auth = auth
    }
    //Navigation bar
    var body: some View {
        VStack {
        // Stacks everything on page
            // Stacks for profile picture
            ProfileHeaderView(showPhotoLibrary: self.$viewModel.showPhotoLibrary, auth: auth).environmentObject(self.viewModel)
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
            if auth{
                
            }
            
            else{
                
                if popover == true{
            
                    PopOverView().environmentObject(self.viewModel)
                    
                }
            }
            

        }
        .sheet(isPresented: self.$viewModel.showPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, userId: self.viewModel.userId)
            }
        .onAppear { () in
            print("getting profile events")
            self.viewModel.retrieveUser()
            self.viewModel.getEvents(status: .open)
            self.viewModel.getEvents(status: .closed)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {}
            }
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("logo2")
                        .resizable()
                        .padding(.top, -15)
                        .frame(width: 125, height: 30)
                        .scaledToFit()
                        
                    
                    if auth {
                        Spacer().frame(minWidth: 100, idealWidth: 100, maxWidth: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        NavigationLink(destination: ProfileSettingsView().environmentObject(self.viewModel)) {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                    
                    else{
                        Spacer().frame(minWidth: 120, idealWidth: 120, maxWidth: 100, alignment: .center)
                        Button( action: {
                            withAnimation(.easeIn){popover.toggle()}

                        }, label: {
                            Image(systemName: "list.dash")
                                .padding(.trailing)
                        })
                    }

                    
                }
                .padding(.leading, 110)
            }
        }
        
            
    }
    
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: MockProfileViewModel(userId: "1"), auth: true)
    }
}




//                    Button(action: {
//                        self.showPopUp.toggle()
//                    },label: {
//                        VStack{
//                            Text("Team").font(.headline).foregroundColor(Color.black)
//                            Text("Members").font(.headline).foregroundColor(Color.black)
//                            Text("50").font(.title).fontWeight(.bold).foregroundColor(Color.black)
//
//                            Spacer()
//                        }
//                    })
//                }.sheet(isPresented: $showPopUp, content: {
//
//                    FinishPickupView()
//
//                    Button(action: {
//                        self.showPopUp.toggle()
//                    },label: {
//                        Text("Dismiss")
//                            .foregroundColor(Color.white)
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 10)
//                            .background(Color.black.opacity(0.8))
//                            .cornerRadius(9)
//                            .padding(.horizontal, 20)
//                    })
//                    //Spacer().frame(height: 300)
//                })



// friends list
//            NavigationLink(
//                destination: FriendsListView(viewModel: FriendsListViewModel(userId: self.viewModel.userId)),
//                label: {
//                    Text("Friend List")
//                })
