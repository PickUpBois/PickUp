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
    @Binding var value: String
    var body: some View {
       
        Spacer().frame(height: 15.0)
        VStack(alignment: .leading){
                
                ZStack(alignment: .leading){
                
                HStack{
                    Text(title).fontWeight(.heavy).frame(width: 60)
                        
                    Spacer().frame(width: 8.0)
                }
                .padding(.leading, 6.0)
                .padding(.vertical, 15.0)
                .background(Color.gray.opacity(0.4))
                
                HStack{
                    TextField(description, text: $value)
                            .foregroundColor(Color("Text"))
                            .lineLimit(0)
                            .padding(.trailing)
                            .frame(width: 200.0, alignment: .leading)
                        
                    Spacer(minLength: 60)
                    
                    Image(systemName: "x.circle.fill")
                        .frame(width: 25.0)
                    }
                    .padding(.leading, 80)
                    .padding(.vertical, 15.0)
                    .background(Color.gray.opacity(0.3))
        
                }.frame(width: 380)
                .cornerRadius(15)

        //Email Text Field Settings


        }
    }
}

struct TypingBlock_Previews: PreviewProvider {
    static var previews: some View {
        TypingBlockView(title: "", description: "", value: .constant(""))
    }
}
