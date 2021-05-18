//
//  PopupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/18/21.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        ScrollView{
HStack(alignment: .top){
            VStack{
                Text("self.viewModel.event.name")
    .fontWeight(.heavy)
Spacer()
Text("self.viewModel.event.info")
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
                    Text("")}
            Spacer()
                HStack{
                Image(systemName:"clock.fill")
                    Text("")}
            Spacer()
                HStack{
                Image(systemName:"person.3.fill")
                    Text("people")}
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


struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}
