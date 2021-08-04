//
//  EventModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 7/29/21.
//

import Foundation

extension Event {
    enum Status {
        case open
        case closed
        case ip
    }
}

extension Event {
    enum Types {
        case tennis
        case basketball
    }
}

struct Event {
    let id: Int
    let name: String
    let info: String
    let startDate: Date
    let endDate: Date?
    let capacity: Int
    let status: Status
    let type: Types
}
