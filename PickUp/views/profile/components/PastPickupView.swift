//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
@EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        ScrollView {
            //viewModel.upcomingEvents needs to change to Past - For Arian
            ForEach(self.viewModel.pastEvents, id: \.self.id) { event in
                Spacer().frame(height: 15)
                VStack {
                        EventDetailsBoxView(event: event, joinEvent: { _ in return})
                        Spacer().frame(height: 10)
                HStack{
                HStack(alignment: .top){
                    Text("🐐")
                    if event.mvp != nil {
                        if event.mvp!.id == AppState.shared.authId {
                            Text("MVP")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .lineLimit(1)
                                .frame(alignment: .leading)}
                            Spacer()
                        }
                    }
                HStack{
                        Text("🏅")
                        Text("W/L")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .lineLimit(1)
                }.padding(.trailing, 60)
                        }
                    }.padding(.all, 25.0)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(8)
                .padding(.horizontal, 20)
                }
            }
        }

        }

extension PastPickupView{
    class ViewModel {
        var events: [GetUserEventsQuery.Data.UserEvent]
        init(events: [GetUserEventsQuery.Data.UserEvent]) {
            self.events = events
}
    }
}
