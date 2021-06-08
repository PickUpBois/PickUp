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
    @State var setScores: [[Int]] = [[0], [0]]
    @State var winningTeam: TeamSelection
    var viewModel: NotificationViewModel
    init(showPopUp: Binding<Bool>, viewModel: NotificationViewModel) {
        self.viewModel = viewModel
        let team = self.viewModel.event!.attendees.map { _ in return TeamSelection.team1}
        self._teamSelections = State(initialValue: team)
        self._winningTeam = State(initialValue: .team1)
        self._showPopUp = showPopUp
    }
    
    func removeRows(at offsets: IndexSet) {
        self.setScores.remove(atOffsets: offsets)
    }
    
    func finishEvent() {
        let team1 = teamSelections.enumerated().compactMap {
            $0.element == .team1 ?  viewModel.event!.attendees[$0.offset].fragments.userDetails.id : nil
        }
        let team2 = teamSelections.enumerated().compactMap {
            $0.element == .team2 ? viewModel.event!.attendees[$0.offset].fragments.userDetails.id : nil
        }
        let input = EndEventInput(eventId: viewModel.event!.id, team1Members: team1, team1Scores: setScores[0], team1Win: winningTeam == .team1, team2Members: team2, team2Scores: setScores[1], team2Win: winningTeam == .team2)
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
            EventDetailsBoxView(event: viewModel.event!, fontColor: .white, joinEvent: {_ in return})
                .frame(width: 300)
                .padding(.all, 30.0)
                .background(Color.gray)
                .cornerRadius(8)
                .padding(.horizontal, 20)
            TeamatePickerView(attendees: mapAttendees(attendees: viewModel.event!.attendees), teamSelections: $teamSelections, winningTeam: $winningTeam)
                .frame(width: 300)
                .padding(.all, 30.0)
                .background(Color.gray)
                .cornerRadius(8)
            
            VStack{
                HStack{
                    Text("Input Score:").fontWeight(.bold)
                }
                .padding(.all, 5.0)
                .font(.body)
                .foregroundColor(Color.white)
                .cornerRadius(8)
                .frame(alignment: .topLeading)
                Spacer().frame(height: 10)
                ForEach(setScores[0].indices, id: \.self) { i in
                    HStack{
                        Text("Set \(i + 1)")
                            .frame(width: 180, alignment:.leading).lineLimit(1)
                        Spacer().frame(width: 5)
                        TextField("", value: $setScores[0][i], formatter: NumberFormatter())
                        Spacer().frame(width: 45)
                        TextField("", value: $setScores[1][i], formatter: NumberFormatter())
                    }
                }
                .onDelete(perform: removeRows)
            
            Button(action: {
                setScores[0].append(0)
                setScores[1].append(0)
                
            },
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
            .background(Color.gray)
            .cornerRadius(8)
            
            Button(action: finishEvent,
                   label: {
                    Text("Finish Pickup")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.pink/*@END_MENU_TOKEN@*/.opacity(0.8))
                    .cornerRadius(9)
                    .padding(.all, 20)
                    
            })
        }
        
    }
}


struct InputScoreView_Previews: PreviewProvider {
    static var previews: some View {
        InputScoreView(showPopUp: .constant(false), viewModel: MockNotificationViewModel())
    }
}
