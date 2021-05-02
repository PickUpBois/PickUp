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
        HStack {
            VStack{
                Button(action: {
                    self.showPhotoLibrary = true
                    print("image was tapped")
                }) {
                    ProfilePicture()
                }
                Text("\(self.observeAuthUseCase.authUser?.firstName ?? "Jim") \(self.observeAuthUseCase.authUser?.lastName ?? "Jim")")
                    .font(.headline).fontWeight(.bold).foregroundColor(Color.black)
                Text("Cyclones").font(.headline).fontWeight(.light).foregroundColor(Color.red)
            Spacer()//Space between profile picture center of page
                }
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



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(showPhotoLibrary: .constant(false))
    }
}
