//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
    var body: some View {
        Spacer().frame(height: 15)
        HStack{
            Text("🎾").font(.system(size: 30))
        }
        VStack{
                    VStack{
                    Spacer()
                        HStack{
                            Text("W or L")
                                .fontWeight(.heavy)
                        Spacer().frame(minWidth: 10, maxWidth: 45)
                Image(systemName:"calendar")
                            Text("Date")
                        Spacer()
                            .frame(minWidth: 10, maxWidth: 45)
                Image(systemName:"location.fill")
                            Text("Location")}
                        Image("wimby08").frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/3).clipped()
                    
                    Spacer().frame(height: 10)
                    HStack(alignment: .center){
                        Image(systemName:"person.circle")
                        Text("With Arian Rahbar + 2 more")}
                    }.padding([.leading, .bottom, .trailing], 15.0)
                        .background(Color(red: 0, green: 1, blue: 0, opacity: 0.25))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
    
            
            
            Spacer().frame(height: 25)
                HStack{
            Text("🏀").font(.system(size: 25))}
                VStack{
                    Spacer()
                            HStack{
                                Text("W or L")
                                    .fontWeight(.heavy)
                            Spacer().frame(minWidth: 10, maxWidth: 45)
                    Image(systemName:"calendar")
                                Text("Date")
                            Spacer()
                                .frame(minWidth: 10, maxWidth: 45)
                    Image(systemName:"location.fill")
                                Text("Location")}
                            Image("Tyrese").frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/3).clipped()
                   
                    Spacer().frame(height: 10)
                    HStack(alignment: .center){
                        Image(systemName:"person.circle")
                        Text("With David Reynolds + 2 more")}
                    
                        }.padding([.leading, .bottom, .trailing], 15.0)
                            .background(Color(red: 1, green: 0.5, blue: 0, opacity: 0.25))
                            .cornerRadius(8)
                        .padding(.horizontal, 20)
        }
    }
}

struct PastPickupView_Previews: PreviewProvider {
    static var previews: some View {
        PastPickupView()
    }
}

