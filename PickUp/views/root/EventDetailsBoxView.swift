//
//  EventDetailsBoxView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/6/21.
//

import SwiftUI

extension Date {
    var eventDateString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter.string(from: self)
        }
    }
    
    var eventTimeString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: self)
        }
    }
}

extension String {
    var dateFromIso: Date? {
        get {
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            guard let date = formatter.date(from: self) else {
                return nil
            }
            return date
        }
    }
}

struct EventDetailsBoxView: View {
    var name: String
    var info: String
    var eventId: String
    var startDate: String
    var startTime: String
    var capacity: Int
    var numAttendees: Int
    var type: EventType
    let going: Bool
    let status: EventStatus
    let joinEvent: (String) -> Void
    let fontColor: Color
    init(event: EventDetails, fontColor: Color = .black, joinEvent: @escaping (String) -> Void) {
        self.name = event.name
        self.info = event.info
        self.eventId = event.id
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
        self.status = event.status
        self.joinEvent = joinEvent
        self.fontColor = fontColor
    }
    var body: some View {
        let emoji = type == .tennis ? "🎾" : "🏀"
        HStack{
        VStack{
        VStack(alignment: .leading){
            HStack{
            Text(emoji).font(.system(size: 20))
            Text(name) //self.viewModel.event.name
                .fontWeight(.heavy)
                .foregroundColor(.black)
            }
Spacer()
            HStack(alignment: .top) {
            Image(systemName:"pencil.circle.fill")
            Text(info)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .lineLimit(3)
                .frame(alignment: .leading)
                //self.viewModel.event.info
            }
Spacer()
//join event 'button'
            if !self.going {
               Button(action: { joinEvent(eventId) }) {
                   Text("+ Join")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.blue).opacity(0.8)
                        .padding(.top, 5.0)
                        .padding(.bottom, 5.0)
                        .padding(.horizontal, 50)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(9.0)
                }
        }
        }.frame(alignment: .leading)
        }

    Spacer()
        VStack(alignment: .leading){
            HStack{
            Image(systemName:"location.fill")
                .foregroundColor(Color.blue)
                Text("Location")
                    .fontWeight(.bold)
                    .foregroundColor(.black)}
        Spacer().frame(height: 5)
            HStack{
            Image(systemName:"calendar")
                .foregroundColor(Color.red)
                Text(startDate)                        .fontWeight(.bold)
                    .foregroundColor(.black)}
        Spacer().frame(height: 5)
            HStack{
            Image(systemName:"clock.fill")
                .foregroundColor(Color.black)
                Text(startTime)                        .fontWeight(.bold)
                    .foregroundColor(.black)}
        Spacer().frame(height: 5)
            HStack{
            Image(systemName:"person.3.fill")
                .foregroundColor(Color.purple)
                Text("\(numAttendees)/\(capacity)")                        .fontWeight(.bold)
                    .foregroundColor(.black)}
        Spacer().frame(height: 5)
          }
        }
    }
}

struct EventDetailsBoxView_Previews: PreviewProvider {
    static let actor = UserDetails(id: "1", firstName: "1", lastName: "last", username: "username")
    static let attendees = [EventDetails.Attendee(id: "1", firstName: "1", lastName: "last", username: "username")]
    static let eventDetails = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open)
    static var previews: some View {
        EventDetailsBoxView(event: eventDetails, joinEvent: { eventId in
            return
        })
    }
}
