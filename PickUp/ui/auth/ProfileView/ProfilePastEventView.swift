//
//  ProfilePastEventView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct ProfilePastEventView: View {
    
    var type: EventType
    init(type: EventType) {
        self.type = type
    }
    var body: some View {
        let emoji: String = self.type == .tennis ? "🎾" : "🏀"
        VStack{
            HStack {
                Text(emoji).font(.system(size: 30))
            }
            Spacer()
                HStack{
                    Text("W or L")
                        .fontWeight(.heavy)
                Spacer().frame(minWidth: 10, maxWidth: 45)
        Image(systemName:"calendar")
                    Text("Date")
                Spacer()
                    .frame(minWidth: 10, maxWidth: 45)
        Image(systemName:"location.fill")
                    Text("Location")}
                Image("wimby08").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/3).clipped()
            
            Spacer().frame(height: 10)
            HStack(alignment: .center){
                Image(systemName:"person.circle")
                Text("With Arian Rahbar + 2 more")}
            }.padding([.leading, .bottom, .trailing], 15.0)
                .background(Color(red: 0, green: 1, blue: 0, opacity: 0.25))
                .cornerRadius(8)
                .padding(.horizontal, 20)
    }
}

protocol IProfilePastEventViewModel: ObservableObject {
    var event: Event { get }
}

class ProfilePastEventViewModel: IProfilePastEventViewModel {
    var event: Event
    init(event: Event) {
        self.event = event
    }
}

struct ProfilePastEventView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePastEventView(type: .tennis)
    }
}
