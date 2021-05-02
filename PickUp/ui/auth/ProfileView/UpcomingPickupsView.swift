//
//  UpcomingPickupsView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/2/21.
//

import SwiftUI

struct UpcomingPickupsView: View {
    var body: some View {
        Spacer()
        VStack{
            HStack{
                Image(systemName:"circle.fill")
                    .foregroundColor(Color.orange)
                    .padding(.leading, 35.0)
.frame(minWidth: 1, maxWidth: 10)
            HStack{
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
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.5))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            }
         
            
            
              }
    }
}

struct UpcomingPickupsView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingPickupsView()
    }
}
