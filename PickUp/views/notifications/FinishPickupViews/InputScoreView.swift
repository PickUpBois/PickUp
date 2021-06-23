//
//  InputScoreView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/24/21.
//

import SwiftUI

struct InputScoreView: View {
    @Binding var showPopUp: Bool
    @State private var checked = true
    
    @State var teamSelections: [TeamSelection]
    @State var winningTeam: TeamSelection
    var viewModel: NotificationViewModel
    @ObservedObject var setScoreViewModel: SetScoresViewModel
    init(showPopUp: Binding<Bool>, viewModel: NotificationViewModel) {
        self.viewModel = viewModel
        let team = self.viewModel.event!.attendees.map { _ in return TeamSelection.team1}
        self._teamSelections = State(initialValue: team)
        self._winningTeam = State(initialValue: .team1)
        self._showPopUp = showPopUp
        self.setScoreViewModel = SetScoresViewModel()
    }
    
    func removeRows(at offsets: IndexSet) {
        self.setScoreViewModel.setScores.remove(atOffsets: offsets)
    }
    
    func finishEvent() {
        let team1 = teamSelections.enumerated().compactMap {
            $0.element == .team1 ?  viewModel.event!.attendees[$0.offset].fragments.userDetails.id : nil
        }
        let team2 = teamSelections.enumerated().compactMap {
            $0.element == .team2 ? viewModel.event!.attendees[$0.offset].fragments.userDetails.id : nil
        }
        let team1Scores = setScoreViewModel.setScores.map { set in
            return Int(set.team1Score) ?? 0
        }
        let team2Scores = setScoreViewModel.setScores.map { set in
            return Int(set.team2Score) ?? 0
        }
        let input = EndEventInput(eventId: viewModel.event!.id, team1Members: team1, team1Scores: team1Scores, team1Win: winningTeam == .team1, team2Members: team2, team2Scores: team2Scores, team2Win: winningTeam == .team2)
        self.viewModel.endEvent(input: input)
        self.showPopUp.toggle()
    }
    
    func mapAttendees(attendees: [EventDetails.Attendee]) -> [UserDetails] {
        return attendees.map { attendee in
            return attendee.fragments.userDetails
        }
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 200)
            EventDetailsBoxView(event: viewModel.event!, fontColor: .white)
                .frame(width: 300)
                .padding(.all, 30.0)
                .background(Color("Background_SmallView"))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            TeamatePickerView(attendees: mapAttendees(attendees: viewModel.event!.attendees), teamSelections: $teamSelections, winningTeam: $winningTeam)
                .frame(width: 300)
                .padding(.all, 30.0)
                .background(Color("Background_SmallView"))
                .cornerRadius(8)
            
            VStack{
                HStack{
                    Text("Input Score:").fontWeight(.bold)
                }
                .padding(.all, 5.0)
                .font(.body)
                .background(Color("Background_SmallView"))
                .cornerRadius(8)
                .frame(alignment: .topLeading)
                Spacer().frame(height: 10)
                ForEach(setScoreViewModel.setScores.indices, id: \.self) { i in
                    SetScoreView(index: i, viewModel: self.setScoreViewModel.setScores[i])
                }
                .onDelete(perform: removeRows)
            
                Button(action: setScoreViewModel.addSet,
                   label: {
                    Text("Add Set")
                        .foregroundColor(Color.blue).opacity(0.8)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(9)
                   })
            }
            .frame(width: 300)
            .padding(.all, 30.0)
            .background(Color("Background_SmallView"))
            .cornerRadius(8)
            
            Button(action: finishEvent,
                   label: {
                    Text("Finish Pickup")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.green.opacity(0.8))
                        .cornerRadius(9)
                    
            })
        }
        .frame(width: 300)
        .padding(.all, 30.0)
        .background(Color("Background_SmallView"))
        .cornerRadius(8)
        
    }
}


struct InputScoreView_Previews: PreviewProvider {
    static var previews: some View {
        InputScoreView(showPopUp: .constant(false), viewModel: MockNotificationViewModel())
    }
}
