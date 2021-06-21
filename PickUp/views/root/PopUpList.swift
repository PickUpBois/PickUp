//
//  PopUpList.swift
//  PickUp
//
//  Created by David Reynolds on 6/21/21.
//

import SwiftUI

struct PopUpList: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                FriendsListView(viewModel: MockFriendsListViewModel(userId: "1")).scaleEffect(0.7)
        }
        }
        
    }
}
 
struct PopUpList_Previews: PreviewProvider {
    static var previews: some View {
        PopUpList()
    }
}

