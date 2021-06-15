//
//  OtherPersonProfileView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/26/21.
//

import SwiftUI

struct OtherPersonProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var selection = 1
    var auth: Bool
    init(viewModel: ProfileViewModel, auth: Bool) {
        self.viewModel = viewModel
        self.auth = auth
    }
    //Navigation bar
    var body: some View {
        NavigationView{
            VStack {
            // Stacks everything on page
                // Stacks for profile picture
                ProfileHeaderView(showPhotoLibrary: self.$viewModel.showPhotoLibrary, auth: auth)
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
        }
        
            
    }
}


struct OtherPersonProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPersonProfileView(viewModel: MockProfileViewModel(userId: "1"), auth: true)
    }
}
