//
//  CreateEventView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct CreateEventView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                    
                    
            }.navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Create Event").font(.headline)
                            }
                        }
                            
                    }
                }
    }
}


struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
