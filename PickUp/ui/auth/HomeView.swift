//
//  HomeView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
            NavigationView {
                ScrollView {
                    Spacer()
                        
                        
                }.navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    Text("Home").font(.headline)
                                }
                            }
                                
                        }
                    }
        }
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
