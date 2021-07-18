//
//  Public.swift
//  PickUp
//
//  Created by David Reynolds on 7/1/21.
//

import SwiftUI

struct PublicView: View {
    @State var showPopUp = false
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
       ZStack{
            VStack{
//top, social media box
                ScrollView {
                    PostedPickUpsView()
                }

            }
        
        VStack{
        Spacer()
        Button(action: {
            self.showPopUp.toggle()
        },label: {
            Image(systemName: "circlebadge.fill")
                .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                .foregroundColor(Color("Tabbar"))
                .frame(width: 50, height: 50)
                .overlay(Image(systemName: "plus").foregroundColor(Color("Text")))

        }).sheet(isPresented: $showPopUp, content: {

            CreatePostView()


        })
        }.padding(.leading, 330)
        .padding(.bottom, 20)
        
        }
    }
    
}

struct PublicView_Previews: PreviewProvider {
    static var previews: some View {
        PublicView()
    }
}
