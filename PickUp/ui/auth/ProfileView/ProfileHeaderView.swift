//
//  ProfileHeaderView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/1/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Binding var showPhotoLibrary: Bool
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    var body: some View {
        VStack(alignment: .center) {
            Text("\(self.observeAuthUseCase.authUser?.firstName ?? "Ashwin")'s Profile").font(.title3) // Leading title on page
            .fontWeight(.bold)
            .padding(.top)
            Spacer().frame(minHeight: 8, maxHeight: 8) // Space between profile
            HStack {
                VStack(alignment: .center){
                    Button(action: {
                        self.showPhotoLibrary = true
                        print("image was tapped")
                    }) {
                        ProfilePicture()
                    }
                    Text("\(self.observeAuthUseCase.authUser?.firstName ?? "Serena") \(self.observeAuthUseCase.authUser?.lastName ?? "Williams")")
                        .font(.headline).fontWeight(.bold).foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 150, maxWidth: 1000)
                    Text("ISU Cyclones").font(.headline).fontWeight(.light).foregroundColor(Color.red).multilineTextAlignment(.center)
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
        ProfileHeaderView(showPhotoLibrary: .constant(false))
    }
}
