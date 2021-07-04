//
//  NearMeView.swift
//  PickUp
//
//  Created by David Reynolds on 7/1/21.
//

import SwiftUI

struct NearMeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    @State var switchScreens = false
    var body: some View {
        ZStack{
        VStack{
            Spacer().frame(height:15)
            
            if switchScreens == false{
                
            PickUpTabListView().environmentObject(viewModel).frame(maxWidth: UIScreen.main.bounds.width * 0.95, maxHeight: UIScreen.main.bounds.height * 1.0, alignment: .top)
            }
            else{
            CourtsNearMeListView().frame(maxWidth: UIScreen.main.bounds.width * 0.95, maxHeight: UIScreen.main.bounds.height * 1.0, alignment: .top)
            }

        }
            VStack{
            Spacer()
            Button(action: {
                self.switchScreens.toggle()
            },label: {
            if switchScreens == false{
                Image(systemName: "circlebadge.fill")
                    .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                    .foregroundColor(Color("Tabbar"))
                    .frame(width: 50, height: 50)
                    .overlay(Image(systemName: "sportscourt").foregroundColor(Color("Text")))
            }
            
            else{
                Image(systemName: "circlebadge.fill")
                    .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                    .foregroundColor(Color("Tabbar"))
                    .frame(width: 50, height: 50)
                    .overlay(Image(systemName: "clock.fill").foregroundColor(Color("Text")))
            }
                
            })
            
            }.padding(.leading, 330)
            .padding(.bottom, 20)
            
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


//Top, near me box
//CourtsNearMeListView()
//    .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height * 0.40, alignment: .top)
//    .padding(.vertical, 10.0)
//    .background(Color("Background"))
//    .cornerRadius(20)
//
//Spacer().frame(height: 15)
//
////Bottom, pickups near me
//PickUpTabListView().environmentObject(viewModel)
//    .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height * 0.40, alignment: .top)
//    .padding(.vertical, 10.0)
//    .background(Color("Background"))
//    .cornerRadius(20)
//
//Spacer().frame(height:15)
