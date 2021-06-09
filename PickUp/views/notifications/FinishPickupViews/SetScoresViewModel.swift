//
//  SetScoresViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/8/21.
//

import Foundation

class SetScoresViewModel: ObservableObject {
    @Published var setScores: [SingleSetScoreViewModel] = []
    
    init() {
        self.setScores = []
        addSet()
    }
    
    func update() {
        self.objectWillChange.send()
    }
    
    func addSet() {
        setScores.append(SingleSetScoreViewModel(viewModel: self))
    }
}

class SingleSetScoreViewModel: ObservableObject {
    let setScoresViewModel: SetScoresViewModel
    init(viewModel: SetScoresViewModel) {
        self.setScoresViewModel = viewModel
    }
    var team1Score: String = "0" {
        didSet {
            setScoresViewModel.update()
        }
    }
    var team2Score: String = "0" {
        didSet {
            setScoresViewModel.update()
        }
    }
}
