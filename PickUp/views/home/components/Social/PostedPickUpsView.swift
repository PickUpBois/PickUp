//
//  OLDpastpickups.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/18/21.
//

import SwiftUI

struct PostedPickUpsView: View {
    var body: some View {
        
                Spacer().frame(height: 5)
        
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
                        .background(Color.white.opacity(0.9))
                                .cornerRadius(8)
                                .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 20)
                    
                    
                    // Repeated Post from before
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
                        
                        Spacer().frame(height: 10)
                            
                            HStack{
                                Text("Caption...")
                                    .lineLimit(3)

                            }.frame(width: 380, height: 80, alignment: .topLeading)
                            

                    }.padding([.leading, .bottom, .trailing], 15.0)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 20)
                    
                    // Repeated Post from before
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
                        
                        Spacer().frame(height: 10)
                            
                            HStack{
                                Text("Caption...")
                                    .lineLimit(3)

                            }.frame(width: 380, height: 80, alignment: .topLeading)
                            

                    }.padding([.leading, .bottom, .trailing], 15.0)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                    
                    
                }
            }
        }

//ImageOverLay over the picture - Person who posted
struct ImageOverlayPerson: View {
    var body: some View {
        ZStack {
            Button(action: {},label: {
            HStack(alignment: .center){
                Image("serena")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 20, height: 20, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                Text("Ashwin Yedavalli  @ash56")}
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
            })
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(.top, 10)
        .padding(.leading, 28)
        .lineLimit(1)
        
    }
}
//ImageOverLay over the picture - People Tagged and Likes
struct ImageOverlayLikes: View {
    var body: some View {
        VStack {
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color.white)})
            Spacer()
                .frame(height: 5.0)
            Text("5")
            
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

struct PostedPickUps_preview: PreviewProvider {
    static var previews: some View {
        PostedPickUpsView()

            }
        }


