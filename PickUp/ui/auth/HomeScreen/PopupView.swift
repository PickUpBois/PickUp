//
//  PopupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/18/21.
//

import SwiftUI

struct PopupView: View {
    @State var showPopUp = false
    var body: some View {
        
            Spacer().frame(height: 300)
            HStack{
            VStack{
                Text("Singles") //self.viewModel.event.name
    .fontWeight(.heavy)
Spacer()
Text("2 out of 3 sets") //self.viewModel.event.info
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
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"calendar")
                    Text("Date")}
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"clock.fill")
                    Text("Time")}
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"person.3.fill")
                    Text("people")}
            Spacer().frame(height: 5)
                    Text("Invite")
                        .fontWeight(.heavy)
                        .padding(.all, 5.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
              }
                  }
        .padding(.all, 30.0)
            .background(Color(red: 1, green: 0.7, blue: 0, opacity: 0.9))
        .cornerRadius(8)
        .padding(.horizontal, 20)
            
        HStack{
            
        Button(action: {},
               label: {Text("Start Pickup")
                .padding(.all, 5.0)
                .font(.body)
                .foregroundColor(Color.white)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
               })
        
            Button(action: {FinishPickupView()},
               label: {Text("Finish Pickup")
                .padding(.all, 5.0)
                .font(.body)
                .foregroundColor(Color.white)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
               })
        }
        
        }

}


struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}
