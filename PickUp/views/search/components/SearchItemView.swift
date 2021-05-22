//
//  SearchItemView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import SwiftUI

struct SearchItemView: View, Identifiable {
    let id: String
    let username: String
    var body: some View {
        Text(username)
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(id: "1", username: "Ashwin")
    }
}
