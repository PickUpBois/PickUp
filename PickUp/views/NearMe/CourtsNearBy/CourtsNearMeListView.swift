//
//  CourtsNearMeListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct CourtsNearMeListView: View {
    @State var expand = false
    var body: some View {
        ZStack{
        VStack(alignment: .leading) {
            HStack{
                Text("BusyBars")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(Color("Text"))
                            
                Image(systemName:"chart.bar.xaxis")
                    .resizable()
                    .frame(width: 20, height: 20)
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
            
            CourtsNearMeView()
            
            }
                if expand {
                DropDown1().frame(height: expand ? 250 : 100)
                    .cornerRadius(20)
                    .padding(7)
                    .animation(.spring())
                    .padding(.leading, 295)
                    .padding(.bottom, 430)
            }
        }
    }
}

struct CourtsNearMeListView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeListView()
    }
}

struct DropDown1 : View {
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
                Text("Time").padding()
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                Text("Open").padding()
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

