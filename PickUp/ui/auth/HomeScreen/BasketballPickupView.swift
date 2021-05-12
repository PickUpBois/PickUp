//
//  BasketballPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/12/21.
//

import SwiftUI

struct BasketballPickupView: View {
    var body: some View {
        Spacer().frame(height: 15)
        VStack{
            HStack{
                Text("🏀").font(.system(size: 30))}
            HStack(alignment: .top){
                VStack{
    Text("Event Name")
        .fontWeight(.heavy)
    Spacer()
    Text("Description")
    Spacer()
    Text("~~~~~~~~~~~")
    Text("~~~~~~~~~~~")
    Text("~~~~~~~~~~~")
    Spacer()
    //join event 'button'
    Text("+ Join")
        .fontWeight(.heavy)
        .padding(.all, 5.0)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                      }
            Spacer()
                VStack{
                    HStack{
                    Image(systemName:"location.fill")
                        Text("Location")}
                Spacer()
                    HStack{
                    Image(systemName:"calendar")
                        Text("Date")}
                Spacer()
                    HStack{
                    Image(systemName:"clock.fill")
                        Text("Time")}
                Spacer()
                    HStack{
                    Image(systemName:"person.3.fill")
                        Text("2/4 people")}
                Spacer()
                    Text("Invite")
                        .fontWeight(.heavy)
                        .padding(.all, 5.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                  }
                      }
            .padding(.all, 25.0)
            .background(Color(red: 1, green: 0.5, blue: 0, opacity: 0.2))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
              }
    }
}

struct BasketballPickupView_Previews: PreviewProvider {
    static var previews: some View {
        BasketballPickupView()
    }
}
