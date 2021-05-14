//
//  CreateSportEventView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/14/21.
//

import SwiftUI

struct CreateSportEventView: View {
    @EnvironmentObject var eventViewModel: CreateEventView.ViewModel
    var body: some View {
        VStack{
            // Stacks everything on page
            
            //Name //e.g. King of the Court
            TypingBlockView(title: "Name", description: "e.g. King of the Court", value: self.$eventViewModel.eventInfo.name)
         
            //Description //e.g. Casual Tennis Match
            TypingBlockView(title: "Info", description: "e.g. casual pickup game", value: self.$eventViewModel.eventInfo.info)
            
            //Location //e.g. Dave's Backyard
            EventLocationPickerView(value: self.$eventViewModel.eventInfo.locationId)
            
            //busyness meter??
            
            EventDatePickerView(date: self.$eventViewModel.eventInfo.startDate)
            
           
            //People //e.g. 4 (doubles)
            TypingBlockView(title: "People", description: "e.g. 4 (doubles)", value: self.$eventViewModel.eventInfo.capacity)
            //Scroll Menu (Like when setting alarm on iPhone)
            
            
        Spacer().frame(height: 25.0)
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Invite Friends")
                .fontWeight(.heavy)
                .padding(.all, 10.0)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                    .background(Color(red: 0, green: 0.7, blue: 0, opacity: 0.55))
                    .cornerRadius(7)
            })
            Spacer().frame(width: 17.5)
            
            Button(action: self.eventViewModel.createEvent, label: {
                Text("Create Event").fontWeight(.heavy)
                    .padding(.all, 10.0)      .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 1))
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
            })
            }
        }
    }
}

struct CreateSportEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSportEventView().environmentObject(CreateEventView.ViewModel())
    }
}
