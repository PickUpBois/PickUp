//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
@EnvironmentObject var viewModel: ProfileViewModel
    
    func getWinLoss(event: EventDetails) -> String {
        print(event)
        var teamIndex = 0
        for i in 0..<event.teams![1].members.count {
            let memberId = event.teams![1].members[i].id
            if AppState.shared.authId == memberId {
                teamIndex = 1
                break
            }
        }
        let teamId = event.teams![teamIndex].id
        let winnerId = event.winner!.id
        if teamId == winnerId {
            return "W"
        } else {
            return "L"
        }
        
        
    }
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
                        Text(getWinLoss(event: event))
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
