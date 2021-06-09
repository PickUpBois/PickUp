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
            BarViewDay(value: 40, date: "Su")
            BarViewDay(value: 80, date: "M")
            BarViewDay(value: 20, date: "T")
            BarViewDay(value: 30, date: "W")
            BarViewDay(value: 90, date: "Th")
            BarViewDay(value: 30, date: "Sa")
            
        }
        }
            BarViewHour(value: 30, hour: "6 A.M.")
            BarViewHour(value: 30, hour: "7 A.M.")
            BarViewHour(value: 30, hour: "8 A.M.")
            BarViewHour(value: 30, hour: "9 A.M.")
            BarViewHour(value: 30, hour: "10 A.M.")
            BarViewHour(value: 30, hour: "11 A.M.")
            BarViewHour(value: 30, hour: "12 P.M.")
            BarViewHour(value: 30, hour: "1 P.M.")
            BarViewHour(value: 30, hour: "2 P.M.")

        }
    }
}

struct BarViewDay: View {
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

struct BarViewHour: View {
    var value: CGFloat
    var hour: String = ""
    var body: some View {
        VStack {
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 100)
                    .foregroundColor(.blue)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.orange)
            }
            Text(hour)
            }
        }
    }


struct BusynessView_Previews: PreviewProvider {
    static var previews: some View {
        BusynessView()
    }
}
