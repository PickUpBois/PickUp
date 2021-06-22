//
//  EventDetailsBoxSmallView.swift
//  PickUp
//
//  Created by David Reynolds on 6/21/21.
//

import SwiftUI

extension EventDetailsBoxSmallView {
    init(id: Int, event: EventDetails) {
        self.name = event.name
        self.id = id
        self.startDate = event.startDate.dateFromIso!
        let attendees = event.attendees.map { (attendee) -> String in
            return attendee.fragments.userDetails.id
        }
        self.capacity = event.capacity
        self.numAttendees = event.attendees.count
        self.going = attendees.contains(AppState.shared.authId ?? "") ? true : false
        self.status = event.status
    }
}


struct EventDetailsBoxSmallView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @State var showPopUp = false
    var name: String
    var startDate: Date
    var id: Int
    var going: Bool
    var status: EventStatus
    var capacity: Int
    var numAttendees: Int

    
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
                ZStack{
                VStack(spacing: 4){
                    
                    HStack(spacing: 5){
                        Text(name)
                            .font((.system(size: 15)))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                        
                    }
                    Divider()
                    
                    HStack (spacing: 10){
                        Image(systemName:"calendar")
                            .resizable()
                            .scaledToFill()
                            .frame(width:10, height:10)
                        .foregroundColor(Color.red)
                        Text(startDate.eventDateString)
                            .font(.footnote)
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                        }.frame(maxWidth: 140, alignment: .leading)
                    .padding(.leading, 4)
                    
                    HStack(spacing: 10){
                        Image(systemName:"clock.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width:10, height:10)
                            .foregroundColor(Color.orange)
                        Text(startDate.eventTimeString)
                        .foregroundColor(Color("Text"))
                            .font(.footnote)
                        .lineLimit(1)
                        }.frame(maxWidth: 140, alignment: .leading)
                    .padding(.leading, 4)
                    
                    HStack(spacing: 10){
                        Image(systemName:"location.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width:10, height:10)
                            .foregroundColor(Color.blue)
                        HStack (spacing: 5){
                        Text("0.25")
                        Text("mi")
                        }.foregroundColor(Color("Text"))
                        .font(.footnote)
                        .lineLimit(1)

                    }.frame(maxWidth: 140, alignment: .leading)
                    .padding(.leading, 4)

                    HStack(spacing: 10){
                        Image(systemName:"person.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width:10, height:10)
                            .foregroundColor(Color.purple)
                        Text("\(numAttendees)/\(capacity)")
                            .font(.footnote)
                            .foregroundColor(Color("Text"))
                            .lineLimit(1)

                    }.frame(maxWidth: 140, alignment: .leading)
                    .padding(.leading, 4)

                }
                
                VStack{
                    HStack{
                        Image("b4")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 25, height: 25)
                            .clipShape(Circle())
                            }.frame(maxWidth: 140, alignment: .trailing)
                    .padding(.trailing, 5)
                    }.frame(maxHeight: 140, alignment: .bottom)
                    
                }
                .frame(maxWidth: 140, maxHeight: 150, alignment: .center)
                .padding(.vertical, 2)
                .padding(.horizontal, 2)
                .cornerRadius(20)
    }
}


struct EventDetailsBoxSmallView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsBoxSmallView(id: 0, event: event1)
    }
    
    static let event1 = EventDetails(id: "0", name: "event", info: "info", capacity: 4, attendees: [], startDate: Date().isoString, type: .tennis, status: .open)
}


