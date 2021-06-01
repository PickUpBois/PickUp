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
    
    init(name: String, startDate: Date, id: Int, going: Bool) {
        self.name = name
        self.startDate = startDate
        self.id = id
        self.going = going
    }
    
    init(id: Int, event: QueryEventsQuery.Data.QueryEvent) {
        self.name = event.name
        self.id = id
        self.startDate = event.startDate.dateFromIso!
        let attendees = event.attendees.map { (attendee) -> String in
            return attendee.id
        }
        self.going = attendees.contains(AppState.shared.authId ?? "") ? true : false
    }
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
       
        HStack(alignment: .center) {
            Button(action: {
                self.showPopUp.toggle()
            }, label: {

                VStack {
                    HStack{
                        Text(name)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                        Image(systemName:"calendar")
                            .foregroundColor(Color.red)
                        Text(getDate(date: startDate))
                            .foregroundColor(Color.black)
                                Spacer()
                                .frame(minWidth: 10, maxWidth: 10)
                                .lineLimit(1)
                    }
                        Spacer().frame(height: 2)
                        HStack(alignment: .center){
                            Image(systemName:"location.fill")
                                .foregroundColor(Color.blue)
                                .lineLimit(1)
                            Text("Location")
                                .foregroundColor(Color.blue)
                            Text(going ? "Going" : "Not going")
                                .foregroundColor(Color.green)
                                .lineLimit(1)
                    }

                }
                
                
            })
        }.sheet(isPresented: $showPopUp, content: {
           
            PopupView(id: id, event: self.viewModel.events[id])
            
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
    static var previews: some View {
        PickUpView(name: "Event", startDate: Date(), id: 0, going: true).environmentObject(MockHomeViewModel())
    }
}
