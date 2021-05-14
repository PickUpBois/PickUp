//
//  DataEvent.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/13/21.
//

import Foundation

enum EventType {
    case tennis
    case basketball
}

extension EventType: Codable {
    
    func encode(to encoder: Encoder) throws {
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: Key.self)
            switch self {
            case .tennis:
                try container.encode(0, forKey: .rawValue)
            case .basketball:
                try container.encode(1, forKey: .rawValue)
            }
        }
    }
    
    enum Key: CodingKey {
        case rawValue
    }
    enum CodingError: Error {
        case unknownValue
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .tennis
        case 1:
            self = .basketball
        default:
            throw CodingError.unknownValue
        }
    }
}

struct EventDto: Codable {
    var id: String? = nil
    var name: String
    var eventType: EventType
    var info: String
    var start: Date
    var end: Date?
    var capacity: Int
    var numPeople: Int
    var locationId: String
}
