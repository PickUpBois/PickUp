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
                        Image("wimby08").resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(ImageOverlayPerson(), alignment: .topLeading)
                            .overlay(ImageOverlayLikes(), alignment: .bottomTrailing)
        
                    
                    Spacer().frame(height: 10)
                        
                        //HStack for W/L, Date, and Location
                        HStack{
                            Text("W or L")
                                .font((.system(size: 15)))
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .foregroundColor(Color.purple)
                        Spacer().frame(minWidth: 10, maxWidth: 45)
                            Image(systemName:"calendar")
                                .foregroundColor(Color.red)
                            Text("Date")
                                .font((.system(size: 15)))
                                .fontWeight(.bold)
                                .foregroundColor(Color("Text"))
                                .lineLimit(1)
                        Spacer()
                            .frame(minWidth: 10, maxWidth: 45)
                            Image(systemName:"location.fill")
                                .foregroundColor(Color.blue)
                            Text("Location")
                                .font((.system(size: 15)))
                                .fontWeight(.bold)
                                .foregroundColor(Color("Text"))
                                .lineLimit(1)
                            
                        }
                        
                    Spacer().frame(height: 10)
                        
                        HStack{
                            Text("Caption...")
                                .font((.system(size: 15)))
                                .fontWeight(.bold)
                                .foregroundColor(Color("Text"))
                                .lineLimit(3)

                        }.frame(width: 380, height: 80, alignment: .topLeading)
                        .padding(.leading, 30)
                        
                    
                    }.padding([.leading, .bottom, .trailing], 15.0)
                    .background(Color("Background_SmallView"))
                                .cornerRadius(8)
                                .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 0)
                    
                    
                    // Repeated Post from before
                    VStack{
                        //Picture Posted
                        Image("wimby08").resizable()
                            .aspectRatio(contentMode: .fit)
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
                        .padding(.leading, 30)
                        
                    
                    }.padding([.leading, .bottom, .trailing], 15.0)
                    .background(Color("Background_SmallView"))
                                .cornerRadius(8)
                                .padding(.horizontal, 20)
                    
                    
                    Spacer().frame(height: 0)
                    
                    // Repeated Post from before
                    VStack{
                        //Picture Posted
                        Image("wimby08").resizable()
                            .aspectRatio(contentMode: .fit)
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
                        .padding(.leading, 30)
                        
                    
                    }.padding([.leading, .bottom, .trailing], 15.0)
                    .background(Color("Background_SmallView"))
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
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                Text("Ashwin Yedavalli  @ash56")}
                .font((.system(size: 13)))
                .padding(5)
                .foregroundColor(.white)
            })
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(.top, 10)
        .padding(.leading, 20)
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
        .padding(.trailing, 20)
        
    }
}

struct PostedPickUps_preview: PreviewProvider {
    static var previews: some View {
        PostedPickUpsView()

            }
        }


