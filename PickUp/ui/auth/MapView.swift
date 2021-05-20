//
//  MapView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer().frame(height: 15)
                Image("isucampus").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width/1, height: UIScreen.main.bounds.height/2).clipped()
                
                    
            }.navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("logo2")
                            .resizable()
                            .padding(.top, -15)
                            .frame(width: 125, height: 30)
                            .scaledToFit()
                    }
                }
                    
            }
        }
    }
}
    

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
