//
//  ICreateEventUseCase.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/14/21.
//

import Foundation

struct CreateEventDto {
    let name: String
    let info: String
    let startDate: Date
    let locationId: String
    let capacity: Int
    let eventType: EventType
}

protocol ICreateEventUseCase {
    func execute(item: CreateEventDto)
}
