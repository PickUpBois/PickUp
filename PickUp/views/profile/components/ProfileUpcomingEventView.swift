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
                    HStack(alignment: .top){
                    VStack{
                    VStack(alignment: .leading){
                        HStack{
                            Text(emoji).font(.system(size: 20))
                            Text(name)
                                .fontWeight(.heavy)
                                .lineLimit(1)
                                Spacer().frame(height: 10)
                            }
                        Spacer().frame(height: 5.0)
                        HStack{
                            Image(systemName:"pencil.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(Color.orange)
                            Text(info)
                                .lineLimit(3)
                        }
                    }
                            
                        Spacer()
                        //join event 'button'
                            Text("+ Join")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.blue).opacity(0.8)
                                .padding(.top, 5.0)
                                .padding(.bottom, 5.0)
                                .padding(.horizontal, 60)
                                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
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
                                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        }
                              }
                    .padding(.all, 25.0)
                    .background(Color.gray.opacity(0.1))
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
