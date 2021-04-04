//
//  ContentViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/4/21.
//

import Foundation
import Combine

enum Page {
    case signup
    case home
}

class ContentViewModel: ObservableObject {
    @Published var currentPage: Page = .signup
}
