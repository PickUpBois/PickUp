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
        Services.shared.apollo.perform(mutation: CreateEventMutation(userId: AppState.shared.authId!, name: eventInfo.name, info: eventInfo.info, capacity: Int(eventInfo.capacity)!, type: .tennis)) { response in
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
        var attendess: [String] = []
    }
}
