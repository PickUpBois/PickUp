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
    @State var expand = false
    var body: some View {
        ZStack{
        VStack{
            HStack{
                Text("PickUps")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
                
            Image(systemName: "sportscourt")
                .resizable()
                .frame(width: 25, height: 20)
                .foregroundColor(Color.blue)
                
            Spacer()
                
                HStack{
                Text("Filters").font(.headline)
                    Image(systemName: expand ? "chevron.up.circle.fill": "chevron.down.circle.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.green)
                }.onTapGesture {
                    self.expand.toggle()
                }
                
            }.padding(.trailing, 15)
            
            Spacer().frame(height: 15)
            
            PickUpListView(type: .basketball)
        }
            if expand {
            DropDown().frame(height: expand ? 250 : 100)
                .cornerRadius(20)
                .padding(7)
                .animation(.spring())
                .padding(.leading, 295)
                .padding(.bottom, 400)
            }
            }
        }
    }

struct PickUpTabListView_Previews: PreviewProvider {
    static var previews: some View {
        PickUpTabListView().environmentObject(MockHomeViewModel())
    }
}

struct DropDown : View {
    @State var expand = false
    var body: some View {
        
        VStack(alignment: .center){
            
            Button(action: {
                
            }) {
                Text("Radius").padding()
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                Text("Date").padding()
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                Text("Going").padding()
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                Text("Capacity").padding()
            }

            
        }.foregroundColor(Color("Text"))
        .font(.caption)
        .background(Color("Tabbar"))
        .cornerRadius(15)
}
}
