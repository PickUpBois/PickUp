//
//  UpcomingPickupsView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct UpcomingPickupsView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @State var friendPopUp = false
    var body: some View {
        ZStack{
        ScrollView {
            ForEach(self.viewModel.upcomingEvents, id: \.self.id) { event in
                Spacer().frame(height: 15)
                VStack {
                    HStack {
                        EventDetailsBoxView(event: event, joinEvent: { _ in return})
                        .padding(.vertical, 15.0)
                        .background(Color("Background_Events"))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                    }
                }
            }
        }
            if self.friendPopUp {
                VStack(alignment:.center){
                    ZStack{
                    PopUpList()
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.6, alignment: .bottom)
                    
                        }
                    .onTapGesture(perform: {
                        withAnimation(.easeIn){self.friendPopUp.toggle()}
                            })
                    .background(Color("Friends_Popup_Background").edgesIgnoringSafeArea(.all))
                            .cornerRadius(20)
                    
                    
                    
                    Button(action: {
                    withAnimation{
                        self.friendPopUp.toggle()
                    }
                }) {
                    Image(systemName: "plus.square.fill").resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.white)
                        .padding(15)

                }
                .background(Color.green)
                .clipShape(Circle())
                .padding(.top, 5)
                }
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
