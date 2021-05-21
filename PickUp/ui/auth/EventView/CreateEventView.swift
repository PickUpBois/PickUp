//
//  CreateEventView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI
import Combine

struct CreateEventView: View {
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    @ObservedObject var viewModel: ViewModel
    init(viewModel: ViewModel = ViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {

        NavigationView {
            ScrollView {
                Spacer().frame(height:15)
                    
                Picker("", selection: self.$viewModel.eventInfo.eventType) {
                    Text("🎾").foregroundColor(Color.blue).tag(EventType.tennis)
                    
                    Text("🏀").foregroundColor(Color.red).tag(EventType.basketball)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)

                CreateSportEventView().environmentObject(self.viewModel)
                    
            }.navigationBarTitleDisplayMode(.inline)
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

extension CreateEventView {
    class ViewModel: ObservableObject {
        @Published var eventInfo: EventInfo = EventInfo()
        let createEventUseCase: ICreateEventUseCase = CreateEventUseCase()
        var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
        var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
        
        func createEvent() {
            self.eventInfo.attendess.append(observeAuthUseCase.dataAuth?.id ?? "None")
//            let dto = CreateEventInput(name: eventInfo.name, info: eventInfo.info, startDate: eventInfo.startDate, locationId: eventInfo.locationId, capacity: Int(eventInfo.capacity) ?? 0, eventType: eventInfo.eventType, attendees: eventInfo.attendess)
            let input = CreateEventInput(name: eventInfo.name, info: eventInfo.info, startDate: ISO8601DateFormatter().string(from: eventInfo.startDate), capacity: Int(eventInfo.capacity) ?? 1, attendees: eventInfo.attendess, type: eventInfo.eventType, status: EventStatus.open)
            createEventUseCase.execute(item: input)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .finished:
                        self.eventInfo = EventInfo()
                    }
                }, receiveValue: {_ in })
                .store(in: &cancellables)
        }
    }
}

extension CreateEventView.ViewModel {
    struct EventInfo {
        var name: String = ""
        var info: String = ""
        var startDate: Date = Date()
        var locationId: String = ""
        var capacity: String = ""
        var eventType: EventType = .tennis
        var attendess: [String] = []
    }
}




struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
