//
//  PopupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/18/21.
//

import SwiftUI

struct PopupView: View, Identifiable {
    @State var showPopUp = false
    var name: String
    var info: String
    var eventId: String
    var startDate: String
    var startTime: String
    var capacity: Int
    var numAttendees: Int
    var type: EventType
    let id: Int
    let going: Bool
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    
    init(name: String, info: String, eventId: String, startDate: Date, capacity: Int, numAttendees: Int, type: EventType, id: Int, going: Bool) {
        self.name = name
        self.info = info
        self.eventId = eventId
        self.startDate = startDate.eventDateString
        self.startTime = startDate.eventTimeString
        self.capacity = capacity
        self.numAttendees = numAttendees
        self.id = id
        self.type = type
        self.going = going
    }
    
    init(id: Int, event: EventDetails) {
        self.name = event.name
        self.info = event.info
        self.eventId = event.id
        self.id = id
        let date = event.startDate.dateFromIso!
        self.startDate = date.eventDateString
        self.startTime = date.eventTimeString
        self.capacity = event.capacity
        self.numAttendees = event.attendees.count
        self.type = event.type
        let attendees = event.attendees.map { (attendee) -> String in
            return attendee.fragments.userDetails.id
        }
        self.going = attendees.contains(AppState.shared.authId ?? "") ? true : false
    }
    var body: some View {
        
            Spacer().frame(height: 300)
            HStack{
            VStack{
                Text(name) //self.viewModel.event.name
    .fontWeight(.heavy)
Spacer()
Text(info) //self.viewModel.event.info
Spacer()
//join event 'button'
                if !self.going {
                    Button(action: { self.viewModel.joinEvent(eventId: eventId)}) {
                        Text("+ Join")
                            .fontWeight(.heavy)
                            .padding(.all, 5.0)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    }
                }
                  }
        Spacer()
            VStack{
                
                HStack{
                Image(systemName:"location.fill")
                    Text("Location")}
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"calendar")
                    Text(startDate)}
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"clock.fill")
                    Text(startTime)}
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"person.3.fill")
                    Text("\(numAttendees)/\(capacity)")}
            Spacer().frame(height: 5)
                    Text("Invite")
                        .fontWeight(.heavy)
                        .padding(.all, 5.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
              }
                  }
        .padding(.all, 30.0)
            .background(Color(red: 1, green: 0.7, blue: 0, opacity: 0.9))
        .cornerRadius(8)
        .padding(.horizontal, 20)
            
        HStack{
            
        Button(action: {},
               label: {Text("Start Pickup")
                .padding(.all, 5.0)
                .font(.body)
                .foregroundColor(Color.white)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
               })
        
            Button(action: {},
               label: {Text("Finish Pickup")
                .padding(.all, 5.0)
                .font(.body)
                .foregroundColor(Color.white)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
               })
        }
        
        }

}


struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(name: "Event", info: "Info", eventId: "1", startDate: Date(), capacity: 4, numAttendees: 1, type: .tennis, id: 0, going: true)
    }
}
