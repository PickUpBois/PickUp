//
//  CreateTennisEvent.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/5/21.
//

import SwiftUI

struct CreateTennisEventView: View {
    var body: some View {
        
        VStack{
        // Stacks everything on page
        
        //Name //e.g. King of the Court
            TypingBlockView(title: "Name", description: "e.g. King of the Court")
     
        //Description //e.g. Casual Tennis Match
        TypingBlockView(title: "Info", description: "e.g. Tennis Match")
        
        //Date
            TypingBlockView(title: "Date", description: "")
        //Calendar Selector tool?
        
        //Time
            TypingBlockView(title: "Time", description: "")
        //Scroll Menu (Like when setting alarm on iPhone)
        
        //Location //e.g. Dave's Backyard
        TypingBlockView(title: "Where", description: "e.g. Dave's Backyard")
        //busyness meter??
       
        //People //e.g. 4 (doubles)
        TypingBlockView(title: "People", description: "e.g. 4 (doubles)")
        //Scroll Menu (Like when setting alarm on iPhone)
            
            
        Spacer().frame(height: 25.0)
        HStack{
            Text("Invite Friends")          .fontWeight(.heavy)
            .padding(.all, 10.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                .background(Color(red: 0, green: 0.7, blue: 0, opacity: 0.55))
                .cornerRadius(7)
            Spacer().frame(width: 17.5)
                
            Text("Create Event").fontWeight(.heavy)
                .padding(.all, 10.0)      .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 1))
                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)

        
        }
        }
    }
}

struct CreateTennisEvent_Previews: PreviewProvider {
    static var previews: some View {
        CreateTennisEventView()
    }
}
