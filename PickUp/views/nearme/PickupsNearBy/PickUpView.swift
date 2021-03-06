//
//  PickUpView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpView: View, Identifiable {
    @EnvironmentObject var viewModel: HomeViewModel
    @State var showPopUp = false
    //@Binding var eventPopUp: Bool
    var name: String
    var startDate: Date
    var id: Int
    var going: Bool
    var status: event_status_enum
    var event: EventDetails
    var numAttendees: Int
    var capacity: Int
    @EnvironmentObject var pickupViewModel: PickUpListViewModel
    init(id: Int, event: EventDetails) {
        self.name = event.name
        self.id = id
        self.startDate = event.startDate.dateFromIso!
        let attendees = event.attendees.map { (attendee) -> String in
            return attendee.fragments.attendeeDetails.user.fragments.userDetails.id
        }
        self.going = attendees.contains(AppState.shared.authId ?? "") ? true : false
        self.status = event.status
        self.event = event
        self.numAttendees = attendees.count
        self.capacity = event.capacity
    }
    
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        ZStack{
            Button(action: {
                //eventPopUp = false
                pickupViewModel.selectedEvent = event
            }, label: {
                VStack(alignment: .leading){
                    //First line w/ title & Going/NotGoing
                    HStack{
                    HStack(spacing: 5){
                        Image("b4")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                        Text(name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(1)
                    }
                    Spacer()
                        
                        if going == true {
                        Text(going ? "Going" : "Not Going")
                                .foregroundColor(Color.green)
                        }
                        else{
                            Text(going ? "Going" : "Not Going")
                                    .foregroundColor(Color.red)
                        }
                    }
                    
                    Spacer().frame(height: 8)
                    
                    //Second Line w/ Capacity
                    
                    HStack{
                        HStack(spacing: 5){
                        Image(systemName:"person.fill")
                            .foregroundColor(Color.purple)
                        Text("Attendees")
                        }
                        ZStack(alignment: .leading){
                            //ZStack for capacity
                            Capsule().frame(width: 200, height: 20)
                                .foregroundColor(.blue)

                            //ZStack for attendees
                            ZStack(alignment: .center){
                            Capsule().frame(width: 100, height: 20)
                                .foregroundColor(.orange).opacity(0.90)
                            Text("\(numAttendees)/\(capacity)")
                            }
                        }
                        
                    }
                    
                    //Third line w/ Date/Time & Radius
                    HStack{
                        HStack (spacing: 5){
                        Image(systemName:"calendar")
                            .foregroundColor(Color.red)

                        Text(getDate(date: startDate))
                        Text("@")
                        Text(startDate.eventTimeString)
                            
                        }
                        
                    Spacer()
                            Text("0.25")
                            Text("miles")
                            
                    }

                }.padding()
                .foregroundColor(Color("Text"))
                .background(Color("Background_SmallView"))
                .cornerRadius(15)
                
            })
        }
        
    }
}



struct PickUpView_Previews: PreviewProvider {
    static let event1 = EventDetails(id: 1, name: "event", info: "info", capacity: 4, attendees: [], startDate: Date().isoString, type: .tennis, status: .open, teams: [])
    static var previews: some View {
        PickUpView(id: 0, event: event1).environmentObject(MockHomeViewModel()).environmentObject(MockPickUpListViewModel())
    }
}


