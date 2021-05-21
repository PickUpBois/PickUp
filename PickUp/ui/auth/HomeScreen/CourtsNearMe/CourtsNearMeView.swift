//
//  CourtInfoView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/12/21.
//

import SwiftUI

struct CourtsNearMeView: View {
    @State var title: String
    @State var radius: String
    //@State var busyness: Image
    @State var available: String
    @State var total: String
    @State var open: String
    
    var body: some View {
  
        Spacer().frame(height: 8)
        VStack{
            HStack{Text(title)
                .fontWeight(.bold)
                .lineLimit(1)
                Spacer().frame(width:1)
                Text(":")
                Spacer().frame(width:5)
                Text(radius)
                Spacer().frame(width:1.5)
                Text("mi")
            }.frame(width:175, alignment: .leading)
            Spacer().frame(height: 5)
            
            HStack{
                Text(available)
                Spacer().frame(width: 1)
                Text("/")
                Spacer().frame(width: 1)
                Text(total)
                Spacer().frame(width: 5)
                Text("open courts")
            }.frame(width: 175, alignment: .leading)
            Spacer().frame(height: 5)
    
        HStack{Text("The facility is")
        Spacer().frame(width: 3)
            Text(open)
                .fontWeight(.semibold)}.frame(width: 175, alignment: .leading)
        
        }
    }
}

struct CourtsNearMeView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeView(title: "", radius: "",available: "", total: "", open: "")
    }
}


