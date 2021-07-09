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
                            .frame(width: 20, height: 20)
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
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                    }
                }.padding(.horizontal, 10)
            }
            
            HStack{
            HStack(spacing: 15){
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.black.opacity(0.3))
                
                TextField("Search...", text: self.$search)
            }.padding(10)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(20)
            }.padding(.horizontal, 10)
            
            Spacer().frame(height: 10)
            
            ChatView().frame(width: UIScreen.main.bounds.width * 1.0, height: UIScreen.main.bounds.height * 1.0)
            
            
        }.padding()
            
        
    }.navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    Text("Messages")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Text"))
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
