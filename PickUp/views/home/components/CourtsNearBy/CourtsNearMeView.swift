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
                ZStack(alignment: .leading){
                Capsule().frame(width: 100, height: 20)
                    .foregroundColor(.blue)
                Capsule().frame(width: 50, height: 20)
                    .foregroundColor(.orange)
                }
            }.frame(width: 175, alignment: .leading)
            Spacer().frame(height: 5)
    
        HStack{Text("The facility is")
        Spacer().frame(width: 3)
            Text(open)
                .fontWeight(.semibold)}.frame(width: 175, alignment: .leading)
        
        }.background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.3))
        .cornerRadius(8)
        Spacer().frame(height: 10)
    }
}

struct CourtsNearMeView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeView(title: "", radius: "",available: "", total: "", open: "")
    }
}


