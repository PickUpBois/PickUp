//
//  PickUpTabListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpTabListView<Model>: View where Model: IPickUpTabListViewModel{
    @State private var selection: EventType = .tennis
    @State var showPopUp = false
    var viewModel: Model
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                Button(action: {
                    self.showPopUp.toggle()
                }, label: {
            HStack{ Text("Pickups Nearby").font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
            Image(systemName: "calendar").font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.red)
            }
                })
            }.sheet(isPresented: $showPopUp, content: {
                
                SocialViewScrollView()
                
                Spacer()
                
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
                Spacer().frame(height: 50)
            })

            Spacer().frame(height:5)
                
            Picker("", selection: $selection) {
                Text("🎾").foregroundColor(Color.blue).tag(EventType.tennis)
                Text("🏀").foregroundColor(Color.red).tag(EventType.basketball)}.pickerStyle(SegmentedPickerStyle())
            
            Spacer().frame(height: 2)
                        
       
            ScrollView {
                if selection == .tennis {
                    PickUpListView(viewModel: PickUpListViewModel(events: self.viewModel.tennisEvents))
                }
                else {
                    PickUpListView(viewModel: PickUpListViewModel(events: self.viewModel.basketballEvents))
                }
            }
        }
    }
}

protocol IPickUpTabListViewModel: ObservableObject {
    var tennisEvents: [Event] { get }
    var basketballEvents: [Event] { get }
}

class PickUpTabListViewModel: IPickUpTabListViewModel {
    @Published var tennisEvents: [Event]
    @Published var basketballEvents: [Event]
    init(tennisEvents: [Event], basketballEvents: [Event]) {
        self.tennisEvents = tennisEvents
        self.basketballEvents = basketballEvents
    }
}

class MockPickUpTabListViewModel: IPickUpTabListViewModel {
    @Published var tennisEvents: [Event]
    @Published var basketballEvents: [Event]
    init() {
        let user = User(id: "1", username: "username", firstName: "firstName", lastName: "lastName", photoUrl: nil)
        let tennisEvent = Event(id: "1", name: "tennis event", info: "info", startDate: Date(), endDate: nil, capacity: 4, attendees: [user], type: .tennis, status: .open)
        let basketballEvent = Event(id: "2", name: "basketball event", info: "info", startDate: Date(), endDate: nil, capacity: 4, attendees: [user], type: .basketball, status: .open)
        self.tennisEvents = [tennisEvent]
        self.basketballEvents = [basketballEvent]
    }
}

struct PickUpTabListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpTabListView(viewModel: MockPickUpTabListViewModel())
    }
}