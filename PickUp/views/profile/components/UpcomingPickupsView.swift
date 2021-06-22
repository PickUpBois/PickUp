//
//  UpcomingPickupsView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct UpcomingPickupsView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @State var eventPopUp = false
    @State var selectedEvent: EventDetails? = nil
    
    let threeColumns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ZStack{
        ScrollView {
            VStack{
                LazyVGrid(columns: threeColumns, spacing: 5){
                    ForEach(self.viewModel.upcomingEvents, id: \.self.id) { event in
                        Button(action: {
                            withAnimation(.easeIn){
                            self.eventPopUp = true
                                
                            selectedEvent = event
                            }
                            
                        }, label: {
                        EventDetailsBoxSmallView(id: 0, event: event)
                        .padding(.vertical, 10.0)
                        .padding(.horizontal, 2)
                        .background(Color("Background_Events"))
                        .cornerRadius(4)
                            
                        })
                    }
                }.padding(.horizontal)
        }
        }
        .opacity(self.eventPopUp ? 0.2: 1)
            
            if self.eventPopUp {
                VStack(alignment:.center){
                    ZStack{
                        EventDetailsBoxView(event: selectedEvent!, joinEvent: {_ in })
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.2, alignment: .top)
                            .padding(.vertical, 10.0)
                            .padding(.horizontal, 10)
                        
                        }.background(Color("Friends_Popup_Background").edgesIgnoringSafeArea(.all))
                            .cornerRadius(20)
                    
                    Button(action: {
                    withAnimation{
                        self.eventPopUp.toggle()
                    }
                }) {
                    Image(systemName: "x.circle.fill").resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("Text"))
                        .padding(15)

                }
                .clipShape(Circle())
                .padding(.top, 5)
                }                                        .onTapGesture(perform: {
                    withAnimation(.easeIn){
                        self.eventPopUp = false}
                        })
            }
        }
        
    }
}

extension UpcomingPickupsView {
    class ViewModel {
        var events: [GetUserEventsQuery.Data.UserEvent]
        init(events: [GetUserEventsQuery.Data.UserEvent]) {
            self.events = events
        }
    }
}



struct UpcomingPickupsView_Previews: PreviewProvider {
    static let attendees = [EventDetails.Attendee(id: "1", firstName: "1", lastName: "last", username: "username")]
    static let event1 = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: attendees, startDate: Date().isoString, type: .tennis, status: .open)
    static let event2 = event1
    static var previews: some View {
        UpcomingPickupsView().environmentObject(MockProfileViewModel(userId: "1"))
    }
}

extension Date {
    var isoString: String {
        get {
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            let isoDateString = formatter.string(from: self)
            return isoDateString
        }
    }
}
