//
//  NearMeView.swift
//  PickUp
//
//  Created by David Reynolds on 7/1/21.
//

import SwiftUI

struct NearMeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        ZStack{
        VStack{
            Spacer().frame(height:15)

            //Top, near me box
            CourtsNearMeListView()
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height * 0.40, alignment: .top)
                .padding(.vertical, 10.0)
                .background(Color("Background"))
                .cornerRadius(20)
            
            Spacer().frame(height: 15)
   
            //Bottom, pickups near me
            PickUpTabListView().environmentObject(viewModel)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height * 0.40, alignment: .top)
                .padding(.vertical, 10.0)
                .background(Color("Background"))
                .cornerRadius(20)
            
            Spacer().frame(height:15)
        }
    }.navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("logo")
                        .resizable()
                        .padding(.top, -5)
                        .frame(width: 130, height: 40)
                        .scaledToFit()
                }
            }
        }
}
}
    

struct NearMeView_Previews: PreviewProvider {
    static var previews: some View {
        NearMeView()
    }
}
