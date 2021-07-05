//
//  SettingsFields.swift
//  PickUp
//
//  Created by David Reynolds on 7/5/21.
//

import SwiftUI

struct SettingsFields: View {
    
    var title : String
    var imgName : String
    var clr : Color

    var body: some View {
        HStack{
            
            Image(systemName: imgName)
                .font(.headline)
                .foregroundColor(clr)
            
            Text(title)
                .font(.headline)
                .foregroundColor(clr)
                .padding(.leading, 10)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}

struct SettingsFields_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFields(title: "Features", imgName: "sparks", clr: .green)
    }
}
