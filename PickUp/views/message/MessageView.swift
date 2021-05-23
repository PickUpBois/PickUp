//
//  MessageView.swift
//  PickUp
//
//  Created by David Reynolds on 5/23/21.
//

import SwiftUI

struct MessageView: View {
    @State var search = ""
    @State var expand = false
    var body: some View {
        ScrollView{
            
        VStack(spacing: 15){
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 18){
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).opacity(0.7)
                            .padding(18)
                    }.background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .clipShape(Circle())
                    
                    ForEach(1...7,id: \.self){i in
                        
                        Button(action: {
                        }) {
                            
                            Image("a\(i)")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            
            HStack(spacing: 15){
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color.black.opacity(0.3))
                
                TextField("Search", text: self.$search)
            }.padding()
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            
            ChatView()
            
        }.padding()
        
    }.navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    Text("Messages")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.blue)
                }
            }
}
}
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
