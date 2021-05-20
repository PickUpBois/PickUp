//
//  HomeView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI
import Combine

struct HomeView<Model>: View where Model: IHomeViewModel {
    @State private var showPopUp = false
    @State var menuOpen: Bool = false
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    @ObservedObject var viewModel: Model
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer().frame(height:15)
                VStack{
    //top, social media box
                    SocialView()
                        .frame(width: 375.0, height: 330.0, alignment: .top)
                        .padding(.horizontal, 6.0)
                        .padding(.vertical, 15.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(20)
                    HStack {
                        //Bottom left, near me box
                        CourtsNearMeListView()
                        Spacer().frame(width: 7)
               
                        //Bottom Right, pickups near me
                        PickUpTabListView(showPopUp: self.showPopUp, viewModel: PickUpTabListViewModel(tennisEvents: self.viewModel.tennisEvents, basketballEvents: self.viewModel.basketballEvents))
                            .frame(width: 175.0, height: 330.0, alignment: .top)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 15.0)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(20)
                            
                    }
                }
                .frame(alignment: .topLeading)
                    
            }
            .onAppear(perform: {
                self.viewModel.getUpcomingEvents()
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("logo2")
                            .resizable()
                            .padding(.top, -15)
                            .frame(width: 125, height: 30)
                            .scaledToFit()
                            }
                                }
                    
                        }
                }
    }
}

protocol IHomeViewModel: ObservableObject {
    var tennisEvents: [Event] { get set }
    var basketballEvents: [Event] { get set }
    func getUpcomingEvents()
}

class HomeViewModel: IHomeViewModel {
    var getEventsUseCase: IGetEventsUseCase
    var cancellables = Set<AnyCancellable>()
    @Published var tennisEvents: [Event] = []
    @Published var basketballEvents: [Event] = []
    init(getEventsUseCase: IGetEventsUseCase = GetEventsUseCase()) {
        self.getEventsUseCase = getEventsUseCase
    }
    func getUpcomingEvents() {
        self.getEventsUseCase.execute(userId: nil, status: .open, type: nil)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("successfully got events")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { events in
                print(events)
                self.tennisEvents = events.filter { event in
                    return event.type == .tennis
                }
                self.basketballEvents = events.filter { event in
                    return event.type == .basketball
                }
            }).store(in: &self.cancellables)
    }
}

class MockHomeViewModel: IHomeViewModel {
    var tennisEvents: [Event] = []
    var basketballEvents: [Event] = []
    func getUpcomingEvents() {
        let user = User(id: "1", username: "username", firstName: "firstName", lastName: "lastName", photoUrl: nil)
        let tennisEvent = Event(id: "1", name: "tennis event", info: "info", startDate: Date(), endDate: nil, capacity: 4, attendees: [user], type: .tennis, status: .open)
        let basketballEvent = Event(id: "2", name: "basketball event", info: "info", startDate: Date(), endDate: nil, capacity: 4, attendees: [user], type: .basketball, status: .open)
        tennisEvents = [tennisEvent]
        basketballEvents = [basketballEvent]
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MockHomeViewModel())
    }
}
