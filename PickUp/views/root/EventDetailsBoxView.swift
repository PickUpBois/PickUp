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
    let fontColor: Color
    let attendeeStatus: EventAttendeeStatus?
    let viewModel: EventDetailsBoxViewModel?
    let event: EventDetails
    init(event: EventDetails, fontColor: Color = .black, viewModel: EventDetailsBoxViewModel? = nil) {
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
        var attendeeStatus: EventAttendeeStatus? {
            for i in 0..<event.attendees.count {
                let attendee = event.attendees[i]
                if attendee.fragments.userDetails.id == AppState.shared.authId {
                    return attendee.fragments.userDetails.eventAttendeeStatus
                }
            }
            return nil
        }
        self.attendeeStatus = attendeeStatus
        self.status = event.status
        self.fontColor = fontColor
        self.viewModel = viewModel
        self.event = event
    }
    
    @State var showPopUp = false
    
    func getWinLoss(event: EventDetails) -> String {
        var teamIndex = 0
        for i in 0..<event.teams![1].members.count {
            let memberId = event.teams![1].members[i].id
            if viewModel?.userId == memberId {
                teamIndex = 1
                break
            }
        }
        let teamId = event.teams![teamIndex].id
        let winnerId = event.winner!.id
        if teamId == winnerId {
            return "Winner"
        } else {
            return "Loser"
        }
    }

    var eventActionView: some View {
        var text = "Join"
        switch attendeeStatus {
        case .ok:
            text = "Leave"
        default:
            text = "Join"
        }
        return Group {
            if viewModel == nil {
                EmptyView()
            } else {
                switch attendeeStatus {
                case .none, .ok:
                    Button(action: { viewModel!.commitAction(eventId: eventId) }) {
                            Text(text)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.center)
                            .opacity(0.8)
                            .padding(.top, 12.0)
                            .padding(.bottom, 12.0)
                            .padding(.horizontal, 20)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(9.0)
                    }
                default:
                    EmptyView()
                }
        }
        }
    }

    var body: some View {
        //Stack for view
        ZStack{
            VStack{
                //Stack for event title/name
                HStack(alignment: .center){
                Text(name) //self.viewModel.event.name
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Text"))
                    
            }.lineLimit(2)
                
            Spacer().frame(height: 4)
            Divider()
                
            //Stack for event info and members
            HStack (alignment: .top){

            //Stack for event info
            HStack (alignment: .top){
                VStack (alignment: .leading){
                    HStack(alignment: .top){
                        Image(systemName:"location.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width:15, height:15)
                            .foregroundColor(Color.blue)
                        VStack{
                        Text("San Fran Tennis Courts")
                            .font((.system(size: 15)))
                            .fontWeight(.regular)
                            .foregroundColor(Color("Text"))
                            .lineLimit(2)
                        }
                    }.frame(maxWidth: 150, alignment: .leading)
                    
                    Spacer().frame(height: 5)
    
                    HStack{
                        Image(systemName:"calendar")
                            .resizable()
                            .scaledToFill()
                            .frame(width:15, height:15)
                            .foregroundColor(Color.red)
                        Text(startDate)
                            .font((.system(size: 15)))
                            .fontWeight(.regular)
                            .foregroundColor(Color("Text"))
                            .lineLimit(1)
                    }.frame(maxWidth: 150, alignment: .leading)
                    
                    Spacer().frame(height: 5)
                    
                    HStack{
                        Image(systemName:"clock.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width:15, height:15)
                            .foregroundColor(Color.orange)
                        Text(startTime)
                            .font((.system(size: 15)))
                            .fontWeight(.regular)
                            .foregroundColor(Color("Text"))
                    }.frame(maxWidth: 150, alignment: .leading)
                    
                    Spacer().frame(height: 5)
                    
                    HStack{
                        Image(systemName:"person.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width:15, height:15)
                            .foregroundColor(Color.purple)
                        Text("\(numAttendees)/\(capacity)")
                            .font((.system(size: 15)))
                            .fontWeight(.regular)
                            .foregroundColor(Color("Text"))
                    }.frame(maxWidth: 150, alignment: .leading)
                    
                    Spacer().frame(height: 5)
                    
                    HStack{
                        if viewModel?.event.mvp?.id != nil {
                            Text("🐐")
                            Text("\(viewModel!.event.mvp!.firstName) \(viewModel!.event.mvp!.lastName)")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Text"))
                                .lineLimit(1)
                                .frame(alignment: .leading)
                    Spacer().frame(height: 5)
                        }
                    }
                    HStack {
                        if event.winner != nil {
                                Image(systemName: "star.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:15, height:15)
                                    .foregroundColor(Color.yellow)
                                Text(getWinLoss(event: event))
                                    .font((.system(size: 15)))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Text"))
                                    .lineLimit(1)
                        
                        }
                        Spacer().frame(height: 5)
                    }
                    .frame(maxWidth: 150, alignment: .leading)
                    .sheet(isPresented: $showPopUp, content: {
                                NavigationView {
                                    VStack{
                                        Spacer()
                                        
                                        //Check mark function needs to be replaced with selector, not "follower"
                                        EventAttendeesView(viewModel: viewModel!.attendeesViewModel)
                                    }
                        
//                                Spacer()
//
//                                Button(action: {
//                                self.showPopUp.toggle()
//                                    },label: {
//                                Text("Invite")
//                                .foregroundColor(Color.white)
//                                .frame(maxWidth: .infinity)
//                                .padding(.vertical, 10)
//                                .background(Color.green.opacity(0.8))
//                                .cornerRadius(9)
//                                .padding(.horizontal, 20)
//                                    }).padding()
                                }
                            })
                    
                    }.frame(maxWidth: 160, alignment: .leading)
                    }
                
            //Stack for Members
            Divider()
                
            HStack(alignment: .top){
                    VStack(alignment: .leading) {
                                EventAttendeesView(viewModel: viewModel!.attendeesViewModel)
                                    

                    }.frame(maxWidth: 160, alignment: .leading)
                }
                
            }.frame(minWidth: 320, maxWidth: 320,  minHeight: 140, maxHeight: 180, alignment: .topLeading)
            
            Divider()
                
                ScrollView{
                    VStack (alignment: .leading){
                        HStack(alignment: .top){
                            Image(systemName: "doc.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width:15, height:15)
                                .foregroundColor(Color.green)
                            Text(info)
                                .font((.system(size: 15)))
                                .fontWeight(.regular)
                                .foregroundColor(Color("Text"))
                                    //self.viewModel.event.info
                            }
                }.frame(maxWidth: 320, alignment: .topLeading)
                .lineLimit(3)
                
                Spacer().frame(height: 15)

                VStack (alignment: .leading){
                    HStack{
                        eventActionView
                        //join event 'button'
//                        if !self.going {
//                            Button(action: { joinEvent(eventId) }) {
//                            Text("+ Join")
//                                .fontWeight(.heavy)
//                                .foregroundColor(Color.blue)
//                                .multilineTextAlignment(.center)
//                                .opacity(0.8)
//                                .padding(.top, 12.0)
//                                .padding(.bottom, 12.0)
//                                .padding(.horizontal, 20)
//                                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
//                                .cornerRadius(9.0)
//                                }
//                            }
//                        else{
//                            HStack{
//                            Button(action: {
//                                self.showPopUp.toggle()
//                            }, label: {
//                            Text("+ Invite")
//                                .fontWeight(.heavy)
//                                .foregroundColor(Color.blue)
//                                .multilineTextAlignment(.center)
//                                .opacity(0.8)
//                                .padding(.top, 12.0)
//                                .padding(.bottom, 12.0)
//                                .padding(.horizontal, 20)
//                                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
//                                .cornerRadius(9.0)
//                                })
//                        }.sheet(isPresented: $showPopUp, content: {
//
//                        VStack{
//                        Spacer()
//
//                        //Check mark function needs to be replaced with selector, not "follower"
//                        FriendsListView(viewModel: MockFriendsListViewModel(userId: "1"))
//
//                        Spacer()
//
//                        Button(action: {
//                        self.showPopUp.toggle()
//                            },label: {
//                        Text("Invite")
//                        .foregroundColor(Color.white)
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical, 10)
//                        .background(Color.green.opacity(0.8))
//                        .cornerRadius(9)
//                        .padding(.horizontal, 20)
//                            }).padding()
//                        }
//                    })
//
//                    }
                }
                }
            }
        }
        }.frame(maxWidth: 320, maxHeight: 320, alignment: .top)
}
}



struct EventDetailsBoxView_Previews: PreviewProvider {
    static let actor = UserDetails(id: "1", firstName: "1", lastName: "last", username: "username")
    static let attendees = [EventDetails.Attendee(id: "1", firstName: "1", lastName: "last", username: "username")]
    static let eventDetails = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open)
    static var previews: some View {
        EventDetailsBoxView(event: eventDetails, viewModel: MockEventDetailsBoxViewModel(event: eventDetails))
    }
}
