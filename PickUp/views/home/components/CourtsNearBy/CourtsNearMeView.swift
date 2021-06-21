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
    @State var percentage: String
    @State var open: String
    
    var body: some View {
        VStack(spacing: 5){
            
            HStack(spacing: 5){
                Text(title)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(Color("Text"))
                
                
            }
            HStack(spacing: 5){
                Text(percentage)
                .foregroundColor(Color("Text"))
                ZStack(alignment: .leading){
                Capsule().frame(width: 100, height: 20)
                    .foregroundColor(.blue)
                Capsule().frame(width: 50, height: 20)
                    .foregroundColor(.orange)
                }
            }

            HStack(spacing: 15){
                Text(open)
                    .foregroundColor(Color("Text"))
                    .fontWeight(.semibold)
                HStack (spacing: 2){
                Text(radius)
                Text("mi")
                }.foregroundColor(Color("Text"))
    
            }

        }
        .frame(maxWidth: 175, alignment: .center)
        .padding(.vertical, 5)
        .background(Color("Background_SmallView"))
        .cornerRadius(20)
        
        Spacer().frame(height: 10)
    }
}

struct CourtsNearMeView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeView(title: "", radius: "", percentage: "", open: "")
    }
}


