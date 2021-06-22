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
            Button(action: {
                self.showPopUp.toggle()
            }, label: {
                ZStack{
                VStack(spacing: 5){
                    
                    HStack(spacing: 5){
                        Text(name)
                            .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                        
                    }
                    
                    HStack (spacing: 5){
                        Image(systemName:"calendar")
                        .foregroundColor(Color.red)
                        Text(startDate.eventDateString)
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                        }.frame(maxWidth: 150, alignment: .leading)
                    
                    HStack (spacing: 5){
                        Text(startDate.eventTimeString)
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                        }.frame(maxWidth: 150, alignment: .leading)
                        .padding(.leading, 25)
                    
                    HStack(spacing: 5){
                        Image(systemName:"location.fill")
                        .foregroundColor(Color.blue)
                        HStack (spacing: 5){
                        Text("0.25")
                        Text("mi")
                        }.foregroundColor(Color("Text"))
                        .lineLimit(1)

                    }.frame(maxWidth: 140, alignment: .leading)

                    HStack(spacing: 5){
                        Image(systemName:"person.3.fill")
                            .foregroundColor(Color.purple)
                        Text("\(numAttendees)/\(capacity)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Text"))
                            .lineLimit(1)

                    }.frame(maxWidth: 140, alignment: .leading)
                }
                
                VStack{
                    HStack{
                        Image("b4")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                            }.frame(maxWidth: 140, alignment: .trailing)
                    .padding(.trailing, 5)
                    }.frame(maxHeight: 140, alignment: .bottom)
                    
                }
                .frame(maxWidth: 140, maxHeight: 150, alignment: .center)
                .padding(.vertical, 2)
                .padding(.horizontal, 2)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                
                
                
                
            })
        
        
    }
}


struct EventDetailsBoxSmallView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsBoxSmallView(id: 0, event: event1)
    }
    
    static let event1 = EventDetails(id: "0", name: "event", info: "info", capacity: 4, attendees: [], startDate: Date().isoString, type: .tennis, status: .open)
}


