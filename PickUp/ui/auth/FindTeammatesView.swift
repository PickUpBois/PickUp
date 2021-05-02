//
//  SearchBar.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct FindTeammatesView: View {
    var body: some View {
        
            ScrollView {
            // Stacks everything on page

                VStack(alignment: .center) {
                    Text("Search for Teammates").font(.title3) // Leading title on page
                    .fontWeight(.bold)
                    .padding(.top)
            Spacer().frame(minHeight: 15, maxHeight: 15) // Space between profile picture and leading title

                }
                
                VStack(alignment: .leading){
                    
                    HStack(alignment: .center) {
                        Image(systemName: "magnifyingglass.circle.fill")
                        
                            .multilineTextAlignment(.leading)
                        
                    Text("Search...")
                        .foregroundColor(.black)
                        Spacer()
                        Text("x")
                    }.padding(.trailing, 180.0)      .frame(width: 310.0)

                    
                //Email Text Field Settings

                }                    .padding(.trailing, 85.0)
                .padding(.vertical, 15.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(8)
                Spacer(minLength: 50)


                    }.navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Profile").font(.headline)
                }
            }
        
                    
            }
}
}
struct FindTeammatesView_Previews: PreviewProvider {
    static var previews: some View {
        FindTeammatesView()
    }
}
