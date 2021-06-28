//
//  ConfirmationNotificationView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/21/21.
//

import SwiftUI

struct ConfirmationNotificationView: View {
    @Binding var mvpPopUp: Bool
    @ObservedObject var viewModel: NotificationViewModel
    @Binding var selectedViewModel: NotificationViewModel?
    let location: String
    var owner: UserDetails?
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    init(viewModel: NotificationViewModel, mvpPopUp: Binding<Bool>, selectedViewModel: Binding<NotificationViewModel?>) {
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
        self._mvpPopUp = mvpPopUp
        self._selectedViewModel = selectedViewModel
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
        
        ZStack{
        VStack{
        HStack {
            Image("serena")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 25, height: 25, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 2)
                .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
            
                Text("\(owner!.firstName) \(owner!.lastName)")
                .fontWeight(.heavy)
                .foregroundColor(Color("Text"))
                .lineLimit(1)
            Spacer()
            Text(getDate(date: viewModel.timestamp))
            .lineLimit(1)
                
            }
            Spacer().frame(height: 10)
                HStack{
                    Button(action: {
                        withAnimation(.easeIn){
                        self.viewModel.actionStatus = .ip
                        self.mvpPopUp = true
                        self.selectedViewModel = viewModel
                        }
                    },label: {
                        Text("\(owner!.firstName) has entered a score of \(getScoreString()) for the event \(viewModel.event!.name) at \(location). Press here to confirm score and finish Pickup!")
                            .foregroundColor(Color.purple)
                            .padding(.leading, 10.0)
                            .lineLimit(3)
                    })
                }
        }
            .padding(.all, 10)
            .frame(width: 400.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
            .opacity(self.mvpPopUp ? 0.2: 1)
            
        }
    }
}

struct ConfirmationNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationNotificationView(viewModel: MockNotificationViewModel(), mvpPopUp: .constant(false), selectedViewModel: .constant(nil))
    }
}



//
//.sheet(isPresented: Binding(get: {
//    switch self.viewModel.actionStatus {
//    case .none, .success:
//        return false
//    case .ip, .failure, .loading:
//        return true
//    }
//}, set: {_ in
//    return
//}), content: {
//
//    FinishPickupView(showPopUp: $showPopUp, viewModel: viewModel)
//        .background(Color("Background_SmallView"))
//
//    Button(action: {
//        self.viewModel.actionStatus = .none
//    },label: {
//        Text("Dismiss")
//            .foregroundColor(Color("Text"))
//            .frame(maxWidth: .infinity)
//            .padding(.vertical, 10)
//            .background(Color("Background_SmallView"))
//            .cornerRadius(9)
//            .padding(.horizontal, 20)
//    })
//    //Spacer().frame(height: 300)
//    .background(BackgroundClearView())
//
//})
