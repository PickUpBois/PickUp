//
//  util.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/25/21.
//

import Foundation

extension EventDetails: Comparable {
    public static func < (lhs: EventDetails, rhs: EventDetails) -> Bool {
        return lhs.startDate.dateFromIso! < rhs.startDate.dateFromIso!
    }
    
    public static func == (lhs: EventDetails, rhs: EventDetails) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
