//
//  CourtsNearMeListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct CourtsNearMeListView: View {
    @State var showPopUp = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("BusyBars")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(Color("Text"))
                            
                Image(systemName:"sportscourt")
                    .foregroundColor(Color.blue)
            Spacer()
                Image(systemName: "square.grid.3x2.fill")
                    .foregroundColor(.green)
            }

            Spacer().frame(height: 15)
            
            CourtsNearMeView()
            
        }
    }
}

struct CourtsNearMeListView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeListView()
    }
}

