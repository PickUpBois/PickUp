//
//  PickUpTabListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct PickUpTabListView: View {
    @State private var selection: EventType = .tennis
    @Binding var showPopUp: Bool
    var body: some View {
        VStack{
            HStack {
                Text("Pickups Nearby").font(.title3)
                    .fontWeight(.semibold)
                Image(systemName: "calendar").font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color.red)}

            Spacer().frame(height:5)
                
            Picker("", selection: $selection) {
                Text("🎾").foregroundColor(Color.blue).tag(EventType.tennis)
                Text("🏀").foregroundColor(Color.red).tag(EventType.basketball)}.pickerStyle(SegmentedPickerStyle())
            
            Spacer().frame(height: 2)
            
            HStack(alignment: .center) {
                Button(action: {
                    self.showPopUp.toggle()
                }, label: {
                    Text("More Details?")
                        .foregroundColor(Color.purple)
                    
                })
                }.sheet(isPresented: $showPopUp, content: {
                    Button(action: {
                        self.showPopUp.toggle()
                    },label: {
                        Text("Dismiss")
                    })
                })
       
            ScrollView {
                if selection == .tennis {
                    PickUpListView()
                }
                else {
                    PickUpListView()
                }
            }
        }
    }
}

struct PickUpTabListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpTabListView(showPopUp: .constant(false))
    }
}
