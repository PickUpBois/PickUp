//
//  UpcomingPickupsView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct UpcomingPickupsView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        ScrollView {
            ForEach(self.viewModel.upcomingEvents, id: \.self.id) { event in
                Spacer().frame(height: 15)
                VStack {
                    HStack {
                        EventDetailsBoxView(event: event, joinEvent: { _ in return})
                            .padding(.all, 25.0)
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(8)
                            .padding(.horizontal, 20)
                    }
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
