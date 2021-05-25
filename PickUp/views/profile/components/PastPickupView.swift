//
//  PastPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct PastPickupView: View {
    @State private var selection = 1
 
    var body: some View {
        Picker("", selection: $selection) {
            Text("Past Posts").foregroundColor(Color.blue).tag(1)
            Text("Past Scores").foregroundColor(Color.red).tag(0)
        }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
        
        if selection == 0 {
            PastScoresView()
        }
        
        else {
            SocialView()
        }
        
    }
}

struct PastPickupView_Previews: PreviewProvider {
    static var previews: some View {
        PastPickupView()
}

}
