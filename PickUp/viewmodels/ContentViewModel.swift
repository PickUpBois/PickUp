//
//  ContentViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Combine
import Firebase

enum Page {
    case signup
    case home
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var currentPage: Page = .signup
    }
}
