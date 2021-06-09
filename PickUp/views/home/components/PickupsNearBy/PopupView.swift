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
        let emoji = type == .tennis ? "🎾" : "🏀"
            Spacer().frame(height: 300)
            HStack{
                VStack{
                    VStack (alignment: .leading){
                    HStack{
                        Text(emoji).font(.system(size: 20))
                        Text(name)
                            .fontWeight(.heavy)
                            .lineLimit(1)
                        }
                    Spacer().frame(height: 10)
                    HStack{
                        Image(systemName:"pencil.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color.orange)
                        Text(info)
                            .lineLimit(3)
                    } //self.viewModel.event.info
                    }
                Spacer()
                //join event 'button'
                if !self.going {
                    Button(action: { self.viewModel.joinEvent(eventId: eventId)}) {
                        Text("+ Join")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.blue).opacity(0.8)
                            .padding(.top, 5.0)
                            .padding(.bottom, 5.0)
                            .padding(.horizontal, 60)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.5))
                            }
                  }
            }
        Spacer()
                VStack{
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName:"location.fill")
                            .foregroundColor(Color.blue)
                        Text("Location")}
                Spacer()
                    HStack{
                        Image(systemName:"calendar")
                            .foregroundColor(Color.red)
                        Text(startDate)}
                Spacer()
                    HStack{
                        Image(systemName:"clock.fill")
                            .foregroundColor(Color.black)
                        Text(startTime)}
                Spacer()
                    HStack{
                        Image(systemName:"person.3.fill")
                            .foregroundColor(Color.purple)
                        Text("\(numAttendees)/\(capacity) people")}
                }
                Spacer()
                    Text("Invite")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.blue).opacity(0.8)
                        .padding(.top, 5.0)
                        .padding(.bottom, 5.0)
                        .padding(.horizontal, 30)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.4))
                }
                  }
        .padding(.all, 30.0)
            .background(Color.white.opacity(0.9))
        .cornerRadius(8)
        .padding(.horizontal, 20)
        
        }

}


struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(name: "Event", info: "Info", eventId: "1", startDate: Date(), capacity: 4, numAttendees: 1, type: .tennis, id: 0, going: true)
    }
}
