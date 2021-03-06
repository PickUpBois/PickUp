//
//  MapSideMenuView.swift
//  PickUp
//
//  Created by David Reynolds on 5/21/21.
//

import SwiftUI

struct MapSideMenuView: View {
    @ObservedObject var mapData : MapViewModel
    @State private var selection = 1
    var body: some View {
        ScrollView{
        VStack{
            Button(action: {}, label: {
                HStack(spacing: 15){
                    Image(systemName: "globe")
                        .foregroundColor(Color.green)
                    Text("Map")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Text"))
                    Spacer(minLength: 0)
                }
                .padding()
            })
            //Sports Picker
            VStack{
            HStack{
                Image(systemName: "sportscourt.fill")
                    .foregroundColor(Color.blue)
                Text("Sports")
                Spacer(minLength: 0)
            }
            .padding()
                
            HStack{
                Image(systemName: "doc.text.fill")
                    .foregroundColor(Color.purple)
                Text("Name")
                Spacer(minLength: 0)
                
                }
            .padding()
            
            VStack{
            HStack{
                Image(systemName: "tablecells.badge.ellipsis")
                    .foregroundColor(Color.red)
                Text("Extra Information")
                Spacer(minLength: 0)
                
                    }
            .padding()
//            BusynessView()
//                .scaleEffect(0.8)
                
            }
                
            }
            
            //Creates the Popout Menu Space (Top -> Bottom)...
            Spacer().frame(height: 500)
            
            HStack{
                Spacer()
                Text("Map")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }
            .padding(10)
        }
        }
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color("MapSideMenu").ignoresSafeArea())
    }
}
