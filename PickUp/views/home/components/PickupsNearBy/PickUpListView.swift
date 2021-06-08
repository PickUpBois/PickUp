//
//  PickUpListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpListView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var type: EventType
    var body: some View {
        ForEach(self.viewModel.events.indices, id: \.self) {i in
            let event = self.viewModel.events[i]
            PickUpView(id: i, event: event)
                    .frame(width: 175, height: 60, alignment: .center)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(8)

                    Spacer().frame(height: 25)
            }
    }
}


struct PickUpListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpListView(type: EventType.tennis).environmentObject(HomeViewModel())
    }
}
