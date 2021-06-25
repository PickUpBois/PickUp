//
//  PickUpListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpListView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var type: EventType
    var body: some View {
        switch viewModel.eventsState {
        case .idle:
            Color.clear.onAppear {
                viewModel.getUpcomingEvents()
            }
        case .loading:
            ProgressView()
        case .success:
            ForEach(self.viewModel.events.indices, id: \.self) {i in
                let event = self.viewModel.events[i]
                PickUpView(id: i, event: event)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.4, maxHeight: UIScreen.main.bounds.height * 0.4)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20)
                    Spacer().frame(height: 10)
                }
        case .error(_):
            ForEach(self.viewModel.events.indices, id: \.self) {i in
                let event = self.viewModel.events[i]
                PickUpView(id: i, event: event)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.4, maxHeight: UIScreen.main.bounds.height * 0.4)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20)
                    Spacer().frame(height: 10)
                }
        }
    }
}


struct PickUpListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpListView(type: EventType.tennis).environmentObject(HomeViewModel())
    }
}
