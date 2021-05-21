//
//  OLDpastpickups.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/18/21.
//

import SwiftUI

struct OLDpastpickups: View {
    var body: some View {
        
                Spacer().frame(height: 5)
        
                VStack{
                    VStack{
                        
                        Image("wimby08").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/4).clipped()
                            .overlay(ImageOverlayPerson(), alignment: .topLeading)
                            .overlay(ImageOverlayLikes(), alignment: .bottomTrailing)
        
                    
                    Spacer().frame(height: 10)
                        
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

                    }.padding([.leading, .bottom, .trailing], 15.0)
                                .background(Color(red: 0, green: 1, blue: 0, opacity: 0.1))
                                .cornerRadius(8)
                                .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 20)
                    
                    VStack{
                        
                        Image("wimby08").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/4).clipped()
                            .overlay(ImageOverlayPerson(), alignment: .topLeading)
                            .overlay(ImageOverlayLikes(), alignment: .bottomTrailing)
        
                    
                    Spacer().frame(height: 10)
                        
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

                    }.padding([.leading, .bottom, .trailing], 15.0)
                        .background(Color(red: 1, green: 0, blue: 0, opacity: 0.1))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 20)
                    
                    VStack{
                        
                        Image("wimby08").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/4).clipped()
                            .overlay(ImageOverlayPerson(), alignment: .topLeading)
                            .overlay(ImageOverlayLikes(), alignment: .bottomTrailing)
        
                    
                    Spacer().frame(height: 10)
                        
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

                    }.padding([.leading, .bottom, .trailing], 15.0)
                        .background(Color(red: 0, green: 0, blue: 1, opacity: 0.1))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                    
                    
                }
            }
        }

struct ImageOverlayPerson: View {
    var body: some View {
        ZStack {
            HStack(alignment: .center){
                Image("serena")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 20, height: 20, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                Text("With Arian Rahbar + 2 more")}
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(.top, 10)
        .padding(.leading, 28)
        
    }
}

struct ImageOverlayLikes: View {
    var body: some View {
        VStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("👍")})
            Spacer()
                .frame(height: 5.0)
            Text("100")

        }
        .padding(.bottom, 5)
        .padding(.trailing, 28)
        
    }
}

struct OLDpastpickups_preview: PreviewProvider {
    static var previews: some View {
        OLDpastpickups()

            }
        }


