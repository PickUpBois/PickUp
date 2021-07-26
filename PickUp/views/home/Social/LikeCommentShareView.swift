//
//  LikeCommentShareView.swift
//  PickUp
//
//  Created by David Reynolds on 7/26/21.
//

import SwiftUI

struct LikeCommentShareView: View {
    @State private var selection = 1
    var body: some View {
        VStack {
            Spacer().frame(height:15)
                
            Picker("", selection: $selection) {
                Text("Likes").foregroundColor(Color.blue).tag(0)
                Text("Comments").foregroundColor(Color.red).tag(1)
                Text("Shares").foregroundColor(Color.red).tag(2)
                
            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            
            if selection == 0 {
                LikesView()
            }
            //second picker option
            
            else if selection == 1 {
                CommentsView()
            }
            
            else {
                SharesView()
                
            }

        Spacer()
        }
    }
}

struct LikeCommentShareView_Previews: PreviewProvider {
    static var previews: some View {
        LikeCommentShareView()
    }
}
