//
//  SwiftUIView.swift
//  PickUp
//
//  Created by David Reynolds on 6/14/21.
//

import SwiftUI

struct PopOverView: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 18) {
            
            Button(action:{
            }) {
                Text("Remove Friend")
            }
            
            Divider()
            Button(action:{
            }) {
                    Text("Block")
            }
            
            Divider()
            Button(action:{
                }) {
                    Text("Report")
            }
            
        }
        .foregroundColor(.black)
        .frame(width: 150)
        .padding()
}
}

struct PopOverView_Previews: PreviewProvider {
    static var previews: some View {
        PopOverView()
    }
}
