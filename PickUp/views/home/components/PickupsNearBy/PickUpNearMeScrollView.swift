//
//  PickUpNearMeScrollView.swift
//  PickUp
//
//  Created by David Reynolds on 5/27/21.
//

import SwiftUI

struct PickUpNearMeScrollView: View {
    var body: some View {
        NavigationView {
        ScrollView{
            ScrollView(.horizontal, showsIndicators: false) {
                
                    HStack(spacing: 18){
                            
                        Button(action: {
                                
                        }) {}
                            ForEach(1...16,id: \.self){i in
                                
                                Button(action: {
                                }) {
                                    
                                    Image("b\(i)")
                                        .resizable()
                                        .renderingMode(.original)
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                }
                            }
                        }
                }
                .padding()
        
            UpcomingPickupsView().environmentObject(ProfileViewModel(userId: "1"))
            
        }.navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                
                HStack(alignment: .center) {
                    Text("                                PickUps Near Me                                ")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .cornerRadius(9)
                        .padding(.horizontal, 20)
                }
    }
}
}
}
}
struct PickUpNearMeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpNearMeScrollView()
}
}
