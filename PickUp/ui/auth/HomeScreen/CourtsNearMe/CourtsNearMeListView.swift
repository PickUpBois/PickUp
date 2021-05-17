//
//  CourtsNearMeListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct CourtsNearMeListView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Courts Near Me")
                    .font(.title3)
                    .fontWeight(.semibold)
                            
            Image(systemName:"location.fill")
                    .foregroundColor(Color.blue)
                        }
            ScrollView {
                ForEach(0..<4) { _ in
                    CourtsNearMeView(title: "example", radius: "0.25", available: "🎾 20", total: "4", open: "open")
                }
            }
        }
            .frame(width: 175.0, height: 330.0, alignment: .top).padding(.horizontal, 9)
            .padding(.vertical, 15.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(20)
    }
}

struct CourtsNearMeListView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeListView()
    }
}
