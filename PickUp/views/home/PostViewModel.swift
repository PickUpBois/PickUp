//
//  PostViewModel.swift
//  PickUp
//
//  Created by David Reynolds on 7/18/21.
//

import Foundation

struct PostViewModel: ObservableObject {
    @Published var selectedPost: PostDetails? = nil
}

class MockPostViewModel: PostViewModel {
    
}
