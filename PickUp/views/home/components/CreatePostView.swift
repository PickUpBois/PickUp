//
//  CreatePostView.swift
//  PickUp
//
//  Created by David Reynolds on 5/22/21.
//

import SwiftUI

struct CreatePostView: View {
    var body: some View {
        
        Spacer().frame(height: 20)
        
        VStack (alignment: .leading){
            //Name Stack
            HStack {
                Image("serena")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 25, height: 25, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                
                Text("Ashwin Yedavalli")
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .lineLimit(1)
            }
            
            Spacer().frame(height: 10)
            
            //Adding Picture and Public/Private Stack
            HStack {
                    Button(action: {},
                           label: {
                    Text("Private or Public")
                        .foregroundColor(Color.blue).opacity(0.8)
                        .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(9)
                    })
                    
                    Spacer().frame(width: 10)
                    
                    Button(action: {
                    },label: {
                    Text("Add Picture")
                        .foregroundColor(Color.blue).opacity(0.8)
                        .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(9)
                    })

                }
            
            Spacer().frame(height: 10)
            
            //Caption Stack
            HStack{
                Text(" Caption...")
                    .foregroundColor(Color.black).opacity(0.8)
            }.frame(width: 380, height: 380, alignment: .topLeading)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0.5)
            
            //Add Teammates Stack
            HStack{
                Button(action: {},
                       label: {
                Text("Add Teammates")
                    .foregroundColor(Color.blue).opacity(0.8)
                    .padding(.vertical, 10)
                        .padding(.horizontal, 130)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(9)
            })
            }
            
            //Post Stack
            HStack{
                Button(action: {},
                       label: {
                Text("Post")
                    .foregroundColor(Color.blue).opacity(0.8)
                    .padding(.vertical, 10)
                        .padding(.horizontal, 175)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(9)
            })
            }
            
            
        }
                
        
        Spacer()
        
        }
    }


struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
