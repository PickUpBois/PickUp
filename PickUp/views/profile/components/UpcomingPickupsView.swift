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
                ProfileUpcomingEventView(event: event)
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
    static let event1 = GetUserEventsQuery.Data.UserEvent(id: "1", name: "2", info: "3", startDate: Date().isoString, capacity: 4, type: .tennis, status: .open, attendees: [])
    static let event2 = GetUserEventsQuery.Data.UserEvent(id: "2", name: "2", info: "3", startDate: Date().isoString, capacity: 4, type: .tennis, status: .open, attendees: [])
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
