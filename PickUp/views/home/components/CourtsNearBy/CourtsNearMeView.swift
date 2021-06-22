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
                    .font((.system(size: 15)))
                    .fontWeight(.bold)
                    .foregroundColor(Color("Text"))
                    .lineLimit(1)
                
                
            }
            HStack(spacing: 5){
                Text(percentage)
                    .foregroundColor(Color("Text"))
                    .font(.footnote)
                    .lineLimit(1)
                ZStack(alignment: .leading){
                Capsule().frame(width: 100, height: 10)
                    .foregroundColor(.blue)
                Capsule().frame(width: 50, height: 10)
                    .foregroundColor(.orange)
                }
            }

            HStack(spacing: 15){
                HStack (spacing: 5){
                Image(systemName:"location.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width:10, height:10)
                    .foregroundColor(Color.blue)
                Text(radius)
                Text("mi")
                }.foregroundColor(Color("Text"))
                .font(.footnote)
                .lineLimit(1)
                
                Text(open)
                    .foregroundColor(Color.green)
                    .font(.footnote)
                    .lineLimit(1)
    
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


