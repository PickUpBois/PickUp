//
//  SocialViewScrollView.swift
//  PickUp
//
//  Created by David Reynolds on 5/21/21.
//

import SwiftUI

struct SocialViewScrollView: View {
    @State var showPopUp = false
    var body: some View {
        NavigationView {
        ScrollView{
        OLDpastpickups()
        
        }.navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    Text("Social Feed")
                        .fontWeight(.heavy)
                }
            }
    }
        }
}
}
struct SocialViewScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SocialViewScrollView()
    }
}
