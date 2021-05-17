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
            
            ScrollView {
                Spacer().frame(height: 0)
                PastPickupView()
            }
        
            }
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
