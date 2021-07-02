//
//  CourtsNearMeFullView.swift
//  PickUp
//
//  Created by David Reynolds on 6/8/21.
//

import SwiftUI

struct CourtsNearMeFullView: View {
    var type: EventType
    var body: some View {
        let emoji = type == .tennis ? "🎾" : "🏀"
        VStack{
        HStack{
        VStack(alignment: .leading){
            HStack{
            Text(emoji).font(.system(size: 20))
            Text("State Gym")
                .fontWeight(.heavy)
                .foregroundColor(.black)
            }
Spacer().frame(height: 5)
            HStack(alignment: .top) {
            Image(systemName:"pencil.circle.fill")
            Text("Fitness Center")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .lineLimit(3)
                .frame(alignment: .leading)
                //self.viewModel.event.info
            }
Spacer().frame(height: 5)
            HStack{
            Image(systemName:"person.3.fill")
                ZStack(alignment: .leading){
                Capsule().frame(width: 100, height: 20)
                    .foregroundColor(.blue)
                Capsule().frame(width: 50, height: 20)
                    .foregroundColor(.orange)
                }
Spacer().frame(height: 5)
          }
        }.frame(alignment: .leading)

    Spacer()
        VStack(alignment: .leading){
            HStack{
            Image(systemName:"location.fill")
                .foregroundColor(Color.blue)
                Text("Location")
                    .fontWeight(.bold)
                    .foregroundColor(.black)}
        Spacer().frame(height: 5)
            HStack{
            Image(systemName:"calendar")
                .foregroundColor(Color.red)
                Text("Open/Not Open")                        .fontWeight(.bold)
                    .foregroundColor(.black)}
        Spacer().frame(height: 5)
            HStack{
            Image(systemName:"clock.fill")
                .foregroundColor(Color.black)
                Text("Hours")                        .fontWeight(.bold)
                    .foregroundColor(.black)}
        Spacer().frame(height: 5)
        }
        }
            BusynessView()
            .scaleEffect(0.8)
            
            
        }   .padding(.all, 15)                         .background(Color.gray.opacity(0.15))
            .cornerRadius(8)
}
    }

struct CourtsNearMeFullView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeFullView(type: .tennis)
    }
}
