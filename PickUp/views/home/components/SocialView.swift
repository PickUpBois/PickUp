//
//  SocialView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/12/21.
//

import SwiftUI

struct SocialView: View {
    @State var showPopUp = false
    @State var postPopup = false
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                Button(action: {
                    self.showPopUp.toggle()
                }, label: {
            HStack{ Text("Social Feed")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                Image(systemName:"newspaper.fill")
                    .foregroundColor(Color.green)
            }
                })
            }.sheet(isPresented: $showPopUp, content: {
                
                SocialViewScrollView()
                
                Spacer()
                Button(action: {
                    self.postPopup.toggle()
                },label: {
                Text("Create Post +")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(9)
                    .padding(.horizontal, 20)
                })
                
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
                Spacer().frame(height: 50)
            })
            
          
            Spacer().frame(height:8)
            
            ScrollView {
                Spacer().frame(height: 0)
                OLDpastpickups()
            }
        
            }
    }
}


struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}