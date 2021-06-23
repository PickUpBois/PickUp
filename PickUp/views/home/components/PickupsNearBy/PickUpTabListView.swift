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
            HStack(alignment: .center) {
                Button(action: {
                    self.showPopUp.toggle()
                }, label: {
            HStack{ Text("PickUps").font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
            Image(systemName: "clock.fill").font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.purple)
            }
                })
            }.sheet(isPresented: $showPopUp, content: {
                
                PickUpNearMeScrollView()
                
                Spacer()
                
                Button(action: {
                    self.showPopUp.toggle()
                },label: {
                    Text("Dismiss")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(9)
                        .padding(.horizontal, 20)
                })
                Spacer().frame(height: 50)
            })

            Spacer().frame(height:5)
                
//            Picker("", selection: $selection) {
//                Text("🎾").foregroundColor(Color.blue).tag(EventType.tennis)
//                Text("🏀").foregroundColor(Color.red).tag(EventType.basketball)}.pickerStyle(SegmentedPickerStyle())
                        
       
            ScrollView {
                PickUpListView(type: .basketball)
//                PickUpListView(type: .tennis)
//                if selection == .tennis {
//                    PickUpListView(type: .tennis)
//                }
//                else {
//                    PickUpListView(type: .basketball)
//                }
            }
        }
    }
}

struct PickUpTabListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpTabListView().environmentObject(MockHomeViewModel())
    }
}
