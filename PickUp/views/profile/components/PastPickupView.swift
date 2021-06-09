//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
    @State private var selection = 1
 
    var body: some View {
//        Picker("", selection: $selection) {
//            Text("Past Posts").foregroundColor(Color.blue).tag(1)
//            Text("Past Scores").foregroundColor(Color.red).tag(0)
//        }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
        
        //if selection == 0 {
        //ProfilePastEventView(type: .tennis)
        ScrollView {
        VStack{
            VStack{
                //Picture Posted
                Image("wimby08").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/4).clipped()
                    .overlay(ImageOverlayPerson(), alignment: .topLeading)
                    .overlay(ImageOverlayLikes(), alignment: .bottomTrailing)

            
            Spacer().frame(height: 10)
                
                //HStack for W/L, Date, and Location
                HStack{
                    Text("W or L")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.purple)
                Spacer().frame(minWidth: 10, maxWidth: 45)
                    Image(systemName:"calendar")
                        .foregroundColor(Color.red)
                    Text("Date")
                Spacer()
                    .frame(minWidth: 10, maxWidth: 45)
                    Image(systemName:"location.fill")
                        .foregroundColor(Color.blue)
                    Text("Location")}
                
            Spacer().frame(height: 10)
                
                HStack{
                    Text("Caption...")
                        .lineLimit(3)

                }.frame(width: 380, height: 80, alignment: .topLeading)
                
            
            }.padding([.leading, .bottom, .trailing], 15.0)
                        .background(Color(red: 0, green: 1, blue: 0, opacity: 0.1))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
            
            Spacer().frame(height: 20)
            }
        }
    }
}
        //}
        
//        else {
//            SocialView()
//        }
        

struct PastPickupView_Previews: PreviewProvider {
    static var previews: some View {
        PastPickupView()
}

}
