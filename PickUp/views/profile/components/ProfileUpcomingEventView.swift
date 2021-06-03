//
//  ProfileUpcomingEventView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

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

struct ProfileUpcomingEventView: View {
    var name: String
    var type: EventType
    var info: String
    var startDate: String
    var startTime: String
    var capacity: Int
    var numAttendees: Int
    
    init(event: EventDetails) {
        self.name = event.name
        self.info = event.info
        self.type = event.type
        let date: Date = event.startDate.dateFromIso!
        self.startDate = date.eventDateString
        self.startTime = date.eventTimeString
        self.capacity = event.capacity
        self.numAttendees = event.attendees.count
    }
    
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    func getTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        let emoji = type == .tennis ? "🎾" : "🏀"
        return VStack{
                    HStack{
                        Text(emoji).font(.system(size: 30))}
                    HStack(alignment: .top){
                        VStack{
                            Text(name)
                .fontWeight(.heavy)
            Spacer()
            Text(info)
            Spacer()
            //join event 'button'
            Text("+ Join")
                .fontWeight(.heavy)
                .padding(.all, 5.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                              }
                    Spacer()
                        VStack {
                            HStack{
                            Image(systemName:"location.fill")
                                Text("Location")}
                        Spacer()
                            HStack{
                            Image(systemName:"calendar")
                                Text(startDate)}
                        Spacer()
                            HStack{
                            Image(systemName:"clock.fill")
                                Text(startTime)}
                        Spacer()
                            HStack{
                            Image(systemName:"person.3.fill")
                                Text("\(numAttendees)/\(capacity) people")}
                        Spacer()
                            Text("Invite")
                                .fontWeight(.heavy)
                                .padding(.all, 5.0)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                          }
                              }
                    .padding(.all, 25.0)
                    .background(Color(red: 1, green: 0.5, blue: 0, opacity: 0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    
                      }
    }
}

protocol IProfileUpcomingEventView: ObservableObject {
    var event: GetUserEventsQuery.Data.UserEvent { get }
}

class ProfileUpcomingEventViewModel: IProfileUpcomingEventView {
    var event: GetUserEventsQuery.Data.UserEvent
    init(event: GetUserEventsQuery.Data.UserEvent) {
        self.event = event
    }
}

struct ProfileUpcomingEventView_Previews: PreviewProvider {
    static let event1 = EventDetails(id: "1", name: "name", info: "info", capacity: 4, attendees: [EventDetails.Attendee(id: "id", firstName: "firstName", lastName: "lastName", username: "username")], startDate: Date().isoString, type: .tennis, status: .open)
    static var previews: some View {
        ProfileUpcomingEventView(event: event1)
    }
}
