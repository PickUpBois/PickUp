//
//  SocialViewScrollView.swift
//  PickUp
//
//  Created by David Reynolds on 5/21/21.
//

import SwiftUI

struct SocialViewScrollView: View {
    @State var showPopUp = false
    var body: some View {
        NavigationView {
        ScrollView{
        PostedPickUpsView()
        
        }.navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                
                HStack(alignment: .center) {
                Button(action: {
                    self.showPopUp.toggle()
                },label: {
                HStack(spacing: 0.0) {
                    Text("                                Create Post +                                ")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(9)
                        .padding(.horizontal, 20)
                }
                })
                }.sheet(isPresented: $showPopUp, content: {
                    
                    CreatePostView()
                    
                    
                    Button(action: {
                        self.showPopUp.toggle()
                    },label: {
                        Text("Dismiss")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(9)
                            .padding(.horizontal, 20)
                    })
                    
                    Spacer().frame(height: 20)
                    
                })
            }
    }
        }
}
}
struct SocialViewScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SocialViewScrollView()
    }
}
