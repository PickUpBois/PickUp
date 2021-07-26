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
        let input = CreateEventInput(capacity: Int(eventInfo.capacity) ?? 1, info: eventInfo.info, name: ISO8601DateFormatter().string(from: eventInfo.startDate), startDate: eventInfo.startDate.isoString, status: event_status_enum.open.rawValue, type: event_type_enum.tennis.rawValue)
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
        var eventType: event_type_enum = .tennis
    }
}
