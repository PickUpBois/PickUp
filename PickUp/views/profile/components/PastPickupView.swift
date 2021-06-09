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
            ForEach(self.viewModel.upcomingEvents, id: \.self.id) { event in
                Spacer().frame(height: 15)
                VStack {
                        EventDetailsBoxView(event: event, joinEvent: { _ in return})
                        Spacer().frame(height: 10)
                HStack{
                HStack(alignment: .top){
                        Text("🐐")
                        Text("MVP")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .frame(alignment: .leading)}
                    Spacer()
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
