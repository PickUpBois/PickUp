//
//  TypingBlock.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/5/21.
//

import SwiftUI

struct TypingBlockView: View {
    var body: some View {
       
        Spacer().frame(height: 25.0)
        VStack(alignment: .leading){
            
            HStack(){
            
                Text("Name:").fontWeight(.heavy).frame(width: 60)
                
                HStack{
                
                    Text("e.g. King of the Court")
                        .fontWeight(.thin)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 200.0)
                Spacer(minLength: 50)
                    
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
        TypingBlockView()
    }
}
