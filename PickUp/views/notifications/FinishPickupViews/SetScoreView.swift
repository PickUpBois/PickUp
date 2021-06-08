//
//  SetScoreView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/8/21.
//

import SwiftUI

struct SetScoreView: View {
    let index: Int
    @State var viewModel: SingleSetScoreViewModel
    var body: some View {
        HStack{
            Text("Set \(index + 1)")
                .frame(width: 180, alignment:.leading).lineLimit(1)
            Spacer().frame(width: 5)
            TextField("", text: $viewModel.team1Score)
            Spacer().frame(width: 45)
            TextField("", text: $viewModel.team2Score)
        }
    }
}

struct SetScoreView_Previews: PreviewProvider {
    static var previews: some View {
        SetScoreView(index: 0, viewModel: SingleSetScoreViewModel(viewModel: SetScoresViewModel()))
    }
}
