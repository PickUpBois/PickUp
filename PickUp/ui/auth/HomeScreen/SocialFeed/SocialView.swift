//
//  SocialView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/12/21.
//

import SwiftUI

struct SocialView: View {
    var body: some View {
        VStack{
            HStack{ Text("Social Feed")
        .font(.title3)
                .fontWeight(.bold)
                Image(systemName:"newspaper.fill")
                    .foregroundColor(Color.green)
                
            }
          
            Spacer().frame(height:1)
            
            Button(action: {},
                   label: {Text("Create Post +")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                    .padding(.all, 1.0)
                    //.background(Color(red: 0, green: 0, blue: 1, opacity: 0.25))
                   })
            
            ScrollView {
                Spacer().frame(height: 0)
                OLDpastpickups()
            }
        
            }
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
