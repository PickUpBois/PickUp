//
//  ProfileUpcomingEventView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct ProfileUpcomingEventView<Model>: View where Model: IProfileUpcomingEventView {
    var viewModel: Model
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    func getTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        let emoji = self.viewModel.event.type == .tennis ? "🎾" : "🏀"
        VStack{
                    HStack{
                        Text(emoji).font(.system(size: 30))}
                    HStack(alignment: .top){
                        VStack{
                            Text(self.viewModel.event.name)
                .fontWeight(.heavy)
            Spacer()
            Text(self.viewModel.event.info)
            Spacer()
            //join event 'button'
            Text("+ Join")
                .fontWeight(.heavy)
                .padding(.all, 5.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                              }
                    Spacer()
                        VStack{
                            HStack{
                            Image(systemName:"location.fill")
                                Text("Location")}
                        Spacer()
                            HStack{
                            Image(systemName:"calendar")
                                Text(getDate(date: self.viewModel.event.startDate))}
                        Spacer()
                            HStack{
                            Image(systemName:"clock.fill")
                                Text(getTime(date: self.viewModel.event.startDate))}
                        Spacer()
                            HStack{
                            Image(systemName:"person.3.fill")
                                Text("\(self.viewModel.event.attendees.count)/\(self.viewModel.event.capacity) people")}
                        Spacer()
                            Text("Invite")
                                .fontWeight(.heavy)
                                .padding(.all, 5.0)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                          }
                              }
                    .padding(.all, 25.0)
                    .background(Color(red: 1, green: 0.5, blue: 0, opacity: 0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    
                      }
    }
}

protocol IProfileUpcomingEventView: ObservableObject {
    var event: Event { get set }
}

class ProfileUpcomingEventViewModel: IProfileUpcomingEventView {
    var event: Event
    init(event: Event) {
        self.event = event
    }
}

struct ProfileUpcomingEventView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUpcomingEventView(viewModel: ProfileUpcomingEventViewModel(event: Event(id: "1", name: "Event", info: "info", startDate: Date(), endDate: nil, capacity: 4, attendees: [User(id: "1", username: "username", firstName: "firstName", lastName: "lastName", photoUrl: "")], type: .tennis, status: .open)))
    }
}
