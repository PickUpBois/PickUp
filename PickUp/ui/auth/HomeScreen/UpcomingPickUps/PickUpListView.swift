//
//  PickUpListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpListView<Model>: View where Model: IPickUpListViewModel{
    var viewModel: Model
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView{
            ForEach(1..<4) {_ in
                PickUpView()
                    .frame(width: 175, height: 60, alignment: .center)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(8)
                
                    Spacer().frame(height: 25)
            }
            }
    }
}

protocol IPickUpListViewModel: ObservableObject {
    var events: [Event] { get }
}

class PickUpListViewModel: IPickUpListViewModel {
    var events: [Event]
    init(events: [Event]) {
        self.events = events
    }
}

struct PickUpListView_Previews: PreviewProvider {
    static let user = User(id: "1", username: "username", firstName: "firstName", lastName: "lastName", photoUrl: nil)
    static let tennisEvent = Event(id: "2", name: "tennis event", info: "info", startDate: Date(), endDate: nil, capacity: 4, attendees: [user], type: .tennis, status: .open)
    static var previews: some View {
        PickUpListView(viewModel: PickUpListViewModel(events: [tennisEvent]))
    }
}
