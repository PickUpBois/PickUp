//
//  HomeView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI
import Combine

struct HomeView: View {
    @State private var showPopUp = false
    @State var menuOpen: Bool = false
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    
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
                        PickUpTabListView(showPopUp: $showPopUp)
                            .frame(width: 175.0, height: 330.0, alignment: .top)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 15.0)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(20)
                            
                    }
                }
                .frame(alignment: .topLeading)
                    
            }
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

extension HomeView {
    class ViewModel {
        var getEventsUseCase: IGetEventsUseCase
        var cancellables = Set<AnyCancellable>()
        var tennisEvents: [Event] = []
        var basketballEvents: [Event] = []
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
                    self.tennisEvents = events.filter { event in
                        return event.type == .tennis
                    }
                    self.basketballEvents = events.filter { event in
                        return event.type == .basketball
                    }
                }).store(in: &self.cancellables)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
