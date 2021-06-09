//
//  TeamatePickerView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/6/21.
//

import SwiftUI

enum TeamSelection {
    case team1
    case team2
}

struct TeamatePickerView: View {
    @State private var checked = true
    var attendees: [UserDetails]
    @Binding var teamSelections: [TeamSelection]
    @Binding var winningTeam: TeamSelection
    
    var body: some View {
        VStack {
            HStack{
                Text("Team 1")
                Spacer().frame(width: 15)
                Text("Team 2")
            }.frame(width: 300, alignment: .trailing)
            Spacer().frame(height: 10)
            ScrollView {
                ForEach(attendees.indices, id: \.self) { i in
                    Group {
                        HStack{
                            Text("\(attendees[i].firstName) \(attendees[i].lastName)").frame(width: 180, alignment:.leading).lineLimit(1)
                            Spacer().frame(width: 5)
                            CheckBoxView(selection: $teamSelections[i], team: .team1)
                            Spacer().frame(width: 45)
                            CheckBoxView(selection: $teamSelections[i], team: .team2)
                        }
                        Spacer().frame(height: 10)
                    }
                }
            }
            .frame(height: 150)
            Spacer().frame(height: 10)
            HStack {
                Text("Winning team")
                Spacer().frame(width: 15)
                VStack {
                    Text("Team 1")
                    CheckBoxView(selection: $winningTeam, team: .team1)
                }
                Spacer().frame(width: 30)
                VStack {
                    Text("Team 2")
                    CheckBoxView(selection: $winningTeam, team: .team2)
                }
            }
        }
    }
}

struct TeamatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TeamatePickerView(attendees: [], teamSelections: .constant([]), winningTeam: .constant(.team1))
    }
}

struct CheckBoxView: View {
    @Binding var selection: TeamSelection
    var team: TeamSelection
    var body: some View {
        Image(systemName: selection == team ? "checkmark.square.fill" : "square")
            .foregroundColor(selection == team ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                selection = team
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false
        
        var body: some View {
            CheckBoxView(selection: .constant(.team1), team: .team1)
        }
    }
    
    static var previews: some View {
        CheckBoxViewHolder()
    }
}
