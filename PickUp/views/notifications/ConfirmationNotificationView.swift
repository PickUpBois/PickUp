//
//  ConfirmationNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct ConfirmationNotificationView: View {
    @State var showPopUp = false
    let viewModel: NotificationViewModel
    let location: String
    var owner: UserDetails?
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    init(viewModel: NotificationViewModel) {
        self.owner = nil
        for attendee in viewModel.event!.attendees {
            let userDetails = attendee.fragments.userDetails
            if userDetails.eventAttendeeStatus == EventAttendeeStatus.owner {
                self.owner = userDetails
                break
            }
        }
        self.viewModel = viewModel
        self.location = "Lied Rec"
        self._showPopUp = State(initialValue: false)
    }
    
    func getScoreString() -> String {
        var teamIndex = 0
        for i in 0..<viewModel.event!.teams![1].members.count {
            let memberId = viewModel.event!.teams![1].members[i].id
            if AppState.shared.authId! == memberId {
                teamIndex = 1
                break
            }
        }
        let team1Scores = viewModel.event!.teams![0].scores
        let team2Scores = viewModel.event!.teams![1].scores
        var scoreString: String = ""
        for i in 0..<team1Scores.count {
            print(team1Scores)
            switch teamIndex {
            case 0:
                scoreString += "\(team1Scores[i])-\(team2Scores[i]) "
            case 1:
                scoreString += "\(team2Scores[i])-\(team1Scores[i]) "
            default:
                scoreString += "\(team1Scores[i])-\(team2Scores[i]) "
            }
        }
        let teamId = viewModel.event!.teams![teamIndex].id
        let winnerId = viewModel.event!.winner!.id
        if teamId == winnerId {
            scoreString += "(W)"
        } else {
            scoreString += "(L)"
        }
        
        return scoreString
        
    }
    var body: some View {
      
        VStack{
        HStack {
            Image("serena")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 25, height: 25, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 2)
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            
                Text("\(owner!.firstName) \(owner!.lastName)")
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .lineLimit(1)
            Spacer()
            Text(getDate(date: viewModel.timestamp))
            .lineLimit(1)
                
            }
            Spacer().frame(height: 10)
                HStack{
                    Button(action: {
                        self.showPopUp.toggle()
                    },label: {
                        Text("\(owner!.firstName) has entered a score of \(getScoreString()) for the event \(viewModel.event!.name) at \(location). Press here to confirm score and finish Pickup!")
                            .foregroundColor(Color.purple)
                            .padding(.leading, 10.0)
                            .lineLimit(3)
                    })
                }.sheet(isPresented: $showPopUp, content: {
                    
                    FinishPickupView(viewModel: viewModel)
                        .background(Color.white.opacity(0.9))
                    
                    Button(action: {
                        self.showPopUp.toggle()
                    },label: {
                        Text("Dismiss")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(9)
                            .padding(.horizontal, 20)
                    })
                    //Spacer().frame(height: 300)
                    .background(BackgroundClearView())

                })
        }
            .padding(.all, 10)
            .frame(width: 400.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
        
    }
}

struct ConfirmationNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationNotificationView(viewModel: MockNotificationViewModel())
    }
}
