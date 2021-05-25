//
//  InputScoreView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/24/21.
//

import SwiftUI

struct InputScoreView: View {
    @State var showPopUp = false
    var body: some View {
        
            Spacer().frame(height: 300)
            HStack{
            VStack{
                Text("Singles") //self.viewModel.event.name
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
Spacer()
                Text("2 out of 3 sets")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white) //self.viewModel.event.info
Spacer()
//join event 'button'
                VStack{
                Text("Input Score:").fontWeight(.bold)
                
                    Text("e.g. 6-4; 6-4").fontWeight(.light)
                }
                 .padding(.all, 5.0)
                 .font(.body)
                    .foregroundColor(Color.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.pink/*@END_MENU_TOKEN@*/)
                    .cornerRadius(8)
                
            }
        Spacer()
            VStack{
                HStack{
                Image(systemName:"location.fill")
                    Text("Location")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)}
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"calendar")
                    Text("Date")                        .fontWeight(.bold)
                        .foregroundColor(Color.white)}
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"clock.fill")
                    Text("Time")                        .fontWeight(.bold)
                        .foregroundColor(Color.white)}
            Spacer().frame(height: 5)
                HStack{
                Image(systemName:"person.3.fill")
                    Text("People")                        .fontWeight(.bold)
                        .foregroundColor(Color.white)}
            Spacer().frame(height: 5)
                    
                Button(action: {},
                       label: {Text("Finish Pickup")
                        .fontWeight(.bold)
                    .padding(.all, 5.0)
                    .font(.body)
                    .foregroundColor(Color.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.pink/*@END_MENU_TOKEN@*/)
                    .cornerRadius(8)
                   })
                
              }
                  }
        .padding(.all, 30.0)
            .background(Color.gray)
        .cornerRadius(8)
        .padding(.horizontal, 20)
        
        }

}



struct InputScoreView_Previews: PreviewProvider {
    static var previews: some View {
        InputScoreView()
    }
}

