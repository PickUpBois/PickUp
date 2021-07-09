//
//  PickUpListViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 7/9/21.
//

import Foundation

class PickUpListViewModel: ObservableObject {
    @Published var selectedEvent: EventDetails? = nil
}

class MockPickUpListViewModel: PickUpListViewModel {
    
}
