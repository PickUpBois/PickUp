//
//  UpcomingPickupsView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct UpcomingPickupsView: View {
    let viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView {
            ForEach(self.viewModel.events, id: \.self.id) { event in
                Spacer().frame(height: 15)
                ProfileUpcomingEventView(viewModel: ProfileUpcomingEventView.ViewModel(event: event))
            }
        }
        
    }
}

extension UpcomingPickupsView {
    class ViewModel {
        var events: [Event]
        init(events: [Event]) {
            self.events = events
        }
    }
}

struct UpcomingPickupsView_Previews: PreviewProvider {
    static let events: [Event] = [Event(id: "1", name: "Event", info: "Info", startDate: Date(), endDate: nil, capacity: 3, attendees: [User(id: "1", username: "arahbar", firstName: "Arian", lastName: "Rahbar", photoUrl: nil)], type: .tennis, status: .open), Event(id: "2", name: "Event", info: "Info", startDate: Date(), endDate: nil, capacity: 3, attendees: [User(id: "1", username: "arahbar", firstName: "Arian", lastName: "Rahbar", photoUrl: nil)], type: .tennis, status: .open)]
    static var previews: some View {
        UpcomingPickupsView(viewModel: UpcomingPickupsView.ViewModel(events: events))
    }
}
