//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
    var body: some View {
        ScrollView {
            Spacer().frame(height: 15)
            ProfilePastEventView(type: .tennis)
            Spacer().frame(height: 25)
            ProfilePastEventView(type: .basketball)
        }
    }
}

struct PastPickupView_Previews: PreviewProvider {
    static var previews: some View {
        PastPickupView()
    }
}

