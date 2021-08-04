//
//  PickUpListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI
import SwiftUIRefresh
struct PickUpListView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var type: event_type_enum

    @State var isShowing: Bool = false
    var body: some View {
        switch viewModel.eventsState {
        case .idle:
            Color.clear.onAppear {
                viewModel.getUpcomingEvents()
            }
        case .loading:
            Spacer()
            ProgressView()
            Spacer()
        case .success:
            ScrollView(){
                ForEach(self.viewModel.events.indices, id: \.self) {i in
                    let event = self.viewModel.events[i]
                    PickUpView(id: i, event: event)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.95, maxHeight: UIScreen.main.bounds.height * 1.0)
                }
            }.pullToRefresh(isShowing: $viewModel.eventsShowing) {
                viewModel.getUpcomingEvents()
            }
        case .error(_):
            ScrollView(){
            List(self.viewModel.events.indices, id: \.self) {i in
                let event = self.viewModel.events[i]
                PickUpView(id: i, event: event)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.95, maxHeight: UIScreen.main.bounds.height * 1.0)
                }
            }.pullToRefresh(isShowing: $viewModel.eventsShowing) {
                viewModel.getUpcomingEvents()
            }
        }
    }
}


struct PickUpListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpListView(type: .tennis).environmentObject(HomeViewModel())
    }
}
