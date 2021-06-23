//
//  PickUpView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpView: View, Identifiable {
    @EnvironmentObject var viewModel: HomeViewModel
    @State var showPopUp = false
    var name: String
    var startDate: Date
    var id: Int
    var going: Bool
    var status: EventStatus
    
    init(id: Int, event: EventDetails) {
        self.name = event.name
        self.id = id
        self.startDate = event.startDate.dateFromIso!
        let attendees = event.attendees.map { (attendee) -> String in
            return attendee.fragments.userDetails.id
        }
        self.going = attendees.contains(AppState.shared.authId ?? "") ? true : false
        self.status = event.status
    }
    
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
            Button(action: {
                self.showPopUp.toggle()
            }, label: {
                VStack(spacing: 5){
                    
                    HStack(spacing: 5){
                        Text(name)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                        
                    }
                    HStack(spacing: 5){
                        HStack (spacing: 2){
                        Image(systemName:"calendar")
                        .foregroundColor(Color.red)
                        Text(getDate(date: startDate))
                        .foregroundColor(Color("Text"))
                        .lineLimit(1)
                        }
                        HStack (spacing: 2){
                        Text("0.25")
                        Text("mi")
                        }.foregroundColor(Color("Text"))
                        .lineLimit(1)

                    }

                    HStack(spacing: 5){
                        Text(going ? "Going" : "Not Going")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)
                            .lineLimit(1)

                    }

                }
                .frame(maxWidth: 175, alignment: .center)
                .padding(.vertical, 5)
                .background(Color("Background_SmallView"))
                .cornerRadius(20)
                
                
                
                
            }).sheet(isPresented: $showPopUp, content: {
            Spacer().frame(height: 300)
                EventDetailsBoxView(event: self.viewModel.events[id], viewModel: EventDetailsBoxViewModel(event: self.viewModel.events[id], refresh: self.viewModel.getUpcomingEvents))
                .padding(.all, 30.0)
                .background(Color("Background_Events"))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
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
            Spacer().frame(height: 300)
            .background(BackgroundClearView())
        })
        
        
    }
}



struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct PickUpView_Previews: PreviewProvider {
    static let event1 = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: [], startDate: Date().isoString, type: .tennis, status: .open)
    static var previews: some View {
        PickUpView(id: 0, event: event1).environmentObject(MockHomeViewModel())
    }
}
