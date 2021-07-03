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
                        Image("Tyrese").resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(ImageOverlayPerson(), alignment: .topLeading)
                            .overlay(ImageOverlayLikes(), alignment: .bottomTrailing)
        
                    
                    Spacer().frame(height: 10)
                        
                        //HStack for Caption
                        
                        HStack{
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "heart")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("100")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            Spacer().frame(width: 40)
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "message")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("25")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            Spacer().frame(width: 40)
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "arrowshape.turn.up.right")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("10")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            
                        }.frame(maxWidth: 380, alignment: .leading)
                        .padding(.leading, 5)
                    
                    Spacer().frame(height: 10)
                        
                        HStack{
                            Text("Caption...")
                                .font(.subheadline)
                                .lineLimit(3)

                        }.frame(width: 380, height: 80, alignment: .topLeading)
                        .padding(.leading, 5)
                        
                        
                        Spacer().frame(height: 10)
                        
                        //HStack for date and Location
                        HStack{
                            Text("Date")
                                .font(.footnote)
                            Spacer().frame(width: 10)
                            Text("Location")
                                .font(.footnote)
                            
                        }.frame(width: 380, alignment: .leading)
                        .padding(.leading, 5)
                        
                        
                    
                    }
                    .padding(.bottom, 15.0)
                    .padding(.horizontal, 0.0)
                    .background(Color("Background_SmallView"))

                    
                    Spacer().frame(height: 0)
                    
                    
                    // Repeated Post from before
                    VStack{
                        //Picture Posted
                        Image("Usain").resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(ImageOverlayPerson(), alignment: .topLeading)
                            .overlay(ImageOverlayLikes(), alignment: .bottomTrailing)
        
                    
                    Spacer().frame(height: 10)
                        
                        //HStack for Caption
                        
                        HStack{
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "heart")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("100")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            Spacer().frame(width: 40)
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "message")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("25")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            Spacer().frame(width: 40)
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "arrowshape.turn.up.right")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("10")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            
                        }.frame(maxWidth: 380, alignment: .leading)
                        .padding(.leading, 5)
                    
                    Spacer().frame(height: 10)
                        
                        HStack{
                            Text("Caption...")
                                .font(.subheadline)
                                .lineLimit(3)

                        }.frame(width: 380, height: 80, alignment: .topLeading)
                        .padding(.leading, 5)
                        
                        
                        Spacer().frame(height: 10)
                        
                        //HStack for date and Location
                        HStack{
                            Text("Date")
                                .font(.footnote)
                            Spacer().frame(width: 10)
                            Text("Location")
                                .font(.footnote)
                            
                        }.frame(width: 380, alignment: .leading)
                        .padding(.leading, 5)
                        
                        
                    
                    }
                    .padding(.bottom, 15.0)
                    .padding(.horizontal, 0.0)
                    .background(Color("Background_SmallView"))

                    
                    
                    Spacer().frame(height: 0)
                    
                    // Repeated Post from before
                    VStack{
                        //Picture Posted
                        Image("wimby08").resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(ImageOverlayPerson(), alignment: .topLeading)
                            .overlay(ImageOverlayLikes(), alignment: .bottomTrailing)
        
                    
                    Spacer().frame(height: 10)
                        
                        //HStack for Caption
                        
                        HStack{
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "heart")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("100")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            Spacer().frame(width: 40)
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "message")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("25")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            Spacer().frame(width: 40)
                            
                            HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "arrowshape.turn.up.right")
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Text"))})
                            Spacer().frame(width: 5.0)
                            Text("10")
                                .foregroundColor(Color("Text"))
                                .font(.caption)
                            }
                            
                            
                        }.frame(maxWidth: 380, alignment: .leading)
                        .padding(.leading, 5)
                    
                    Spacer().frame(height: 10)
                        
                        HStack{
                            Text("Caption...")
                                .font(.subheadline)
                                .lineLimit(3)

                        }.frame(width: 380, height: 80, alignment: .topLeading)
                        .padding(.leading, 5)
                        
                        
                        Spacer().frame(height: 10)
                        
                        //HStack for date and Location
                        HStack{
                            Text("Date")
                                .font(.footnote)
                            Spacer().frame(width: 10)
                            Text("Location")
                                .font(.footnote)
                            
                        }.frame(width: 380, alignment: .leading)
                        .padding(.leading, 5)
                        
                        
                    
                    }
                    .padding(.bottom, 15.0)
                    .padding(.horizontal, 0.0)
                    .background(Color("Background_SmallView"))
                    
                    
                    
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
        .padding(.top, 5)
        .padding(.leading, 5)
        .lineLimit(1)
        
    }
}
//ImageOverLay over the picture - People Tagged and Likes
struct ImageOverlayLikes: View {
    var body: some View {
        VStack {
            
            //Pop up for Event that was tagged
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "sportscourt")
                        .foregroundColor(Color.white)})
            Spacer()
            
            //Popup for People that were tagged
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color.white)})

            Text("5")
        }
        .padding(.top, 13)
        .padding(.bottom, 5)
        .padding(.trailing, 5)
        
    }
}

struct PostedPickUps_preview: PreviewProvider {
    static var previews: some View {
        PostedPickUpsView()

            }
        }


