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
        HStack{
        VStack{
            Text(name) //self.viewModel.event.name
                .fontWeight(.heavy)
                .foregroundColor(fontColor)

Spacer()
            Text(info)
                .fontWeight(.bold)
                .foregroundColor(fontColor)
                .lineLimit(3)
                .frame(alignment: .leading)
                //self.viewModel.event.info
Spacer()
//join event 'button'
        }.frame(alignment: .leading)

    Spacer()
        VStack{
            HStack{
            Image(systemName:"location.fill")
                Text("Location")
                    .fontWeight(.bold)
                    .foregroundColor(fontColor)}
        Spacer().frame(height: 5)
            HStack{
            Image(systemName:"calendar")
                Text(startDate)                        .fontWeight(.bold)
                    .foregroundColor(fontColor)}
        Spacer().frame(height: 5)
            HStack{
            Image(systemName:"clock.fill")
                Text(startTime)                        .fontWeight(.bold)
                    .foregroundColor(fontColor)}
        Spacer().frame(height: 5)
            HStack{
            Image(systemName:"person.3.fill")
                Text("\(numAttendees)/\(capacity)")                        .fontWeight(.bold)
                    .foregroundColor(fontColor)}
        Spacer().frame(height: 5)
          }
        }
    }
}

struct EventDetailsBoxView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsBoxView(event: EventDetails(id: "1", name: "name", info: "info", capacity: 4, attendees: [], startDate: Date().isoString, endDate: nil, type: .tennis, status: .open), joinEvent: { eventId in
            return
        })
    }
}
