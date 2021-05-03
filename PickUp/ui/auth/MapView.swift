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
                Spacer()
                    
                    
            }.navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Map").font(.headline)
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
