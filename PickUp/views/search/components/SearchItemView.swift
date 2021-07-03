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
        HStack{
            Image("placeholder")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 40, height: 40, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .overlay(Circle().stroke(Color("ColorThicknessPhoto")))

            VStack (alignment: .leading){
            Text(username)
                .font(.subheadline)
            Text("Arian Rahbar")
                .font(.subheadline)
            }
        }
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(id: "1", username: "Ashwin")
    }
}
