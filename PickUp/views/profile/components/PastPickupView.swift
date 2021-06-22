//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
@EnvironmentObject var viewModel: ProfileViewModel

let threeColumns = [GridItem(), GridItem(), GridItem()]

    func getWinLoss(event: EventDetails) -> String {
        var teamIndex = 0
        for i in 0..<event.teams![1].members.count {
            let memberId = event.teams![1].members[i].id
            if viewModel.user?.id == memberId {
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
        ZStack{
        ScrollView {
            VStack {
            LazyVGrid(columns: threeColumns, spacing: 5){
            ForEach(self.viewModel.pastEvents, id: \.self.id) { event in
                    EventDetailsBoxSmallView(id: 0, event: event)
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 2)
                    .background(Color("Background_Events"))
                    .cornerRadius(4)
            }
                }.padding(.horizontal)
            }
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



//HStack(alignment: .top){
//        Text("🐐")
//        if event.mvp != nil {
//            if event.mvp!.id == viewModel.user?.id {
//                Text("MVP")
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//                    .lineLimit(1)
//                    .frame(alignment: .leading)}
//                Spacer()
//            }
//        }
//HStack{
//        Text("🏅")
//            Text(getWinLoss(event: event))
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//                .lineLimit(1)
//    }.padding(.trailing, 60)
