//
//  OnevOneView.swift
//  PickUp
//
//  Created by David Reynolds on 6/28/21.
//

import SwiftUI

struct OnevOneView: View {
    var body: some View {
        ScrollView{

        VStack{
            Spacer()
           
        //This View will be expanded upon ina future update
        Text("You are Great!")
            }
            
        }.navigationTitle("One vs One")
    }
}

struct OnevOneView_Previews: PreviewProvider {
    static var previews: some View {
        OnevOneView()
    }
}
