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
        VStack{
            HStack{
                Text("PickUps").font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
                
            Image(systemName: "clock.fill").font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.purple)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 18){
                    
                    Button(action: {
                        
                    }) {}
                    ForEach(1...16,id: \.self){i in
                        
                        Button(action: {
                        }) {
                            
                            Image("b\(i)")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .frame(width: .infinity)
            .padding(.horizontal, 20)
                        
                PickUpListView(type: .basketball)
            
        }
    }
}

struct PickUpTabListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpTabListView().environmentObject(MockHomeViewModel())
    }
}
