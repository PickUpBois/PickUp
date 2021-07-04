//
//  PickUpTabListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpTabListView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var selection: EventType = .tennis
    @State var showPopUp = false
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text("PickUps").font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
                
            Image(systemName: "clock.fill").font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.blue)
                
                Spacer()
                Image(systemName: "square.grid.3x2.fill")
                    .foregroundColor(.green)
            }
            
            Spacer().frame(height: 15)
            
            PickUpListView(type: .basketball)
            
        }
    }
}

struct PickUpTabListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpTabListView().environmentObject(MockHomeViewModel())
    }
}
