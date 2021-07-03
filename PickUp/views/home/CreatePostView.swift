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
        
        ZStack{
            
        VStack (alignment: .leading){
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
            
            Spacer().frame(height: 10)
            
            //Adding Picture and Public/Private Stack
            HStack {
                    Button(action: {},
                           label: {
                    Text("Private or Public")
                        .foregroundColor(Color("Text"))
                        .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(9)
                    })
                    
                    Spacer().frame(width: 10)
                    
                    Button(action: {
                    },label: {
                    Text("Add Picture")
                        .foregroundColor(Color("Text"))
                        .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(9)
                    })

                }
            
            Spacer().frame(height: 10)
            
            //Caption Stack
            HStack{
                Text(" Write Something...")
                    .foregroundColor(Color("Text")).opacity(0.5)
            }.frame(width: 380, height: 380, alignment: .topLeading)
            .border(Color("Text"), width: 0.25)
            
            //Tag Teammates Stack
            HStack{
                Button(action: {},
                       label: {
                Text("Tag Teammates")
                    .foregroundColor(Color("Text"))
                    .padding(.vertical, 10)
                        .padding(.horizontal, 130)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(9)
            })
            }
            
            //Tag Event/PickUp Stack
            HStack{
                Button(action: {},
                       label: {
                Text("Tag Event")
                    .foregroundColor(Color("Text"))
                    .padding(.vertical, 10)
                        .padding(.horizontal, 152)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(9)
            })
            }
            
            //Post Stack
            HStack{
                Button(action: {},
                       label: {
                Text("Post")
                    .foregroundColor(Color("Text"))
                    .padding(.vertical, 10)
                        .padding(.horizontal, 172)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(9)
            })
            }
            
            
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
