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
    var type: EventType
    let Columns = [GridItem(), GridItem()]

    @State var isShowing: Bool = false
    var body: some View {
        switch viewModel.eventsState {
        case .idle:
            Color.clear.onAppear {
                viewModel.getUpcomingEvents()
            }
        case .loading:
            ProgressView()
        case .success:
            ScrollView(.horizontal){
                LazyHGrid(rows: Columns, spacing: 5) {
                ForEach(self.viewModel.events.indices, id: \.self) {i in
                    let event = self.viewModel.events[i]
                    PickUpView(id: i, event: event)
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height * 0.4)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(20)
                        Spacer().frame(height: 10)
                }
                }.frame(height: 200)
                .padding(.horizontal, 10)
            }.pullToRefresh(isShowing: $viewModel.eventsShowing) {
                viewModel.getUpcomingEvents()
            }
        case .error(_):
            List(self.viewModel.events.indices, id: \.self) {i in
                let event = self.viewModel.events[i]
                PickUpView(id: i, event: event)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height * 0.4)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20)
                    Spacer().frame(height: 10)
            }.pullToRefresh(isShowing: $viewModel.eventsShowing) {
                viewModel.getUpcomingEvents()
            }
        }
    }
}


struct PickUpListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpListView(type: EventType.tennis).environmentObject(HomeViewModel())
    }
}
