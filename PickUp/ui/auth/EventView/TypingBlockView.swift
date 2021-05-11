//
//  TypingBlock.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/5/21.
//

import SwiftUI

struct TypingBlockView: View {
    @State var title: String
    @State var description: String
    var body: some View {
       
        Spacer().frame(height: 25.0)
        VStack(alignment: .leading){
            
            HStack(){
            
                Text(title).fontWeight(.heavy).frame(width: 60)
                
                HStack{
                    Spacer()
                        .frame(width: 8.0)
                    Text(description)
                        .fontWeight(.thin)
                .foregroundColor(.black)
                        .lineLimit(0)
                        .padding(.trailing)
                        .frame(width: 200.0, alignment: .leading)
                    
                Spacer(minLength: 60)
                    
                Image(systemName: "x.circle.fill")
                    .frame(width: 25.0)
                    
            }.frame(width: 320).padding(.horizontal, 6.0)
            .padding(.vertical, 15.0)
        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
        .cornerRadius(20)
                
                    }


            
        //Email Text Field Settings


        }
    }
}

struct TypingBlock_Previews: PreviewProvider {
    static var previews: some View {
        TypingBlockView(title: "", description: "")
    }
}
