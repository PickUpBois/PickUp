//
//  CreatePostView.swift
//  PickUp
//
//  Created by David Reynolds on 5/22/21.
//

import SwiftUI

struct CreatePostView: View {
    @State var currentPostType = "Public"
    @State var tagPopUp = false
    @State var attachPopUp = false
    var body: some View {
        
        Spacer().frame(height: 20)
        
        ZStack{
            
            VStack (alignment: .leading, spacing: 10){
            //Name Stack
            HStack {
                Image("serena")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 25, height: 25, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                
                Text("Ashwin Yedavalli")
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Text"))
                    .lineLimit(1)
            }
            
            
            //Public/Private Stack
                   
                HStack(spacing: 10 ){
                    
                    ForEach(["Private","Public"],id: \.self) {tab in
                    
                        PostTabButton(title: tab, currentType: $currentPostType)
                    
                    }

                }
                
            //Caption Stack
            HStack{
                Text(" Write Something...")
                    .foregroundColor(Color("Text")).opacity(0.5)
            }.frame(maxWidth: .infinity, maxHeight: 200, alignment: .topLeading)
            .border(Color("Text"), width: 0.25)
                
                    
            
            //Tag Teammates Stack
            VStack(alignment: .leading, spacing: 10){
                
                Text("Tag Teammates")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                
                HStack(){
                    ForEach(1...3,id: \.self){i in
                        
                        Image("a\(i)")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                            .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.tagPopUp.toggle()
                    },label: {
                    Text("Tag Teammates")
                        .font(.caption)
                        .foregroundColor(Color("Text"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(Color("DescriptionEvent").opacity(0.8))
                            .cornerRadius(9)
                    }).sheet(isPresented: $tagPopUp, content: {
                        
                        TagFriendsView()
                        
                        
                    })

                    
                }
                Divider()
        }
            
        
            //Tag Event/PickUp Stack
            VStack(alignment: .leading, spacing: 10){
                
                Text("Attach Event")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                
                HStack(spacing: 10){
                    
                    Text("🏀 Baskeball at State Gym")
                    
                    Spacer(minLength: 50)
                    
                    Button(action: {
                        self.attachPopUp.toggle()
                    },label: {
                    Text("Attach Event")
                        .font(.caption)
                        .foregroundColor(Color("Text"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(Color("DescriptionEvent").opacity(0.8))
                            .cornerRadius(9)
                    }).sheet(isPresented: $attachPopUp, content: {
                        
                        AttachPickupView()
                        
                    })
                    
                }
                
                Divider()
        }
            
            //Adding Picture/Video Stack
        HStack{
            Button(action: {
                },label: {
                Text("Add Picture or Video")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color("DescriptionEvent").opacity(0.8))
                        .cornerRadius(9)
                })
                }
            
            //Post Stack
            HStack{
                Button(action: {},
                       label: {
                Text("Post")
                    .foregroundColor(Color("Text"))
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color("DescriptionEvent").opacity(0.8))
                    .cornerRadius(9)
            })
            }
            
            
        }.padding(.horizontal, 10)
            
        }
        
        Spacer()
        
        }
    }

struct PostTabButton: View {
    var title: String
    @Binding var currentType: String
    
    var body: some View {
        
        Button{
            
            withAnimation{
                
                currentType = title
                
            }
            
        } label: {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(
                    
                    Capsule()
                .stroke(Color("DescriptionEvent"))
            )
            
                .background(
                    
                    Capsule()
                        .fill(Color("DescriptionEvent").opacity(title == currentType ? 1 : 0))
            )
            
        }
    }
}


struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}




