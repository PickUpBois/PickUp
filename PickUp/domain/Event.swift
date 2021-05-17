//
//  Event.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/14/21.
//

import Foundation

struct Event: Identifiable {
    var id: String
    var name: String
    var info: String
    var startDate: Date
    var endDate: Date?
    var capacity: Int
    var attendees: [User]
    var type: EventType
    var status: EventStatus
}
