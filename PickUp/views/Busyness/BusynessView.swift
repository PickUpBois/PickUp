//
//  BusynessView.swift
//  PickUp
//
//  Created by David Reynolds on 6/8/21.
//

import SwiftUI

struct BusynessView: View {
    var body: some View {
    
        Spacer().frame(height:10)
        VStack{
        VStack{
        Text("State Gym")
        HStack (spacing: 16){
            BarView(value: 40, date: "Su")
            BarView(value: 80, date: "M")
            BarView(value: 20, date: "T")
            BarView(value: 30, date: "W")
            BarView(value: 90, date: "Th")
            BarView(value: 30, date: "Sa")
        }
        }
        Spacer().frame(height: 10)
        VStack{
        Text("Lied")
        HStack (spacing: 16){
            BarView(value: 40, date: "Su")
            BarView(value: 30, date: "M")
            BarView(value: 40, date: "T")
            BarView(value: 50, date: "W")
            BarView(value: 20, date: "Th")
            BarView(value: 90, date: "Sa")
        }
        }
        Spacer().frame(height: 10)
        VStack{
        Text("Tennis Courts")
        HStack (spacing: 16){
            BarView(value: 90, date: "Su")
            BarView(value: 30, date: "M")
            BarView(value: 20, date: "T")
            BarView(value: 50, date: "W")
            BarView(value: 40, date: "Th")
            BarView(value: 50, date: "Sa")
        }
        }
        }
    }
}

struct BarView: View {
    var value: CGFloat
    var date: String = ""
    var body: some View {
        VStack {
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 100)
                    .foregroundColor(.blue)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.orange)
            }
            Text(date)
            }
        }
    }


struct BusynessView_Previews: PreviewProvider {
    static var previews: some View {
        BusynessView()
    }
}
