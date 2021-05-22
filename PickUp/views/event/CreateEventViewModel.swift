//
//  CreateEventViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation

class CreateEventViewModel: ObservableObject {
    @Published var eventInfo: EventInfo = EventInfo()
    
    func createEvent() {
        self.eventInfo.attendess.append(AppState.shared.authId ?? "None")
        let input = CreateEventInput(name: eventInfo.name, info: eventInfo.info, startDate: ISO8601DateFormatter().string(from: eventInfo.startDate), capacity: Int(eventInfo.capacity) ?? 1, attendees: eventInfo.attendess, type: eventInfo.eventType, status: EventStatus.open)
        Services.shared.apollo.perform(mutation: CreateEventMutation(input: input)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                    return
                }
                self.eventInfo = EventInfo()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension CreateEventViewModel {
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
