//
//  CourtsNearMeListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/17/21.
//

import SwiftUI

struct CourtsNearMeListView: View {
    @State var showPopUp = false
    var body: some View {
        VStack {
            HStack {
                Text("BusyBars")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(Color("Text"))
                            
                Image(systemName:"sportscourt")
                    .foregroundColor(Color.blue)
            }
            
            HStack{
            Text("Gyms")
                .font(.headline)
                .fontWeight(.semibold)
                
            
            Spacer().frame(width: 5)
                
                HStack{
                        
                        Button(action: {
                        }) {
                            Image("b8")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                        }
            }

                
            }.frame(maxWidth: 380, alignment: .leading)
            .padding(.leading, 10)
            
            Spacer().frame(height: 15)
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(0..<15) { value in
                        CourtsNearMeView(title: "🎾 State Gym", radius: "0.25", percentage: "100%", open: "open")
                            .frame(maxWidth: 175)
                }
                }
            }
            .padding(.horizontal, 10)
            
            
            Spacer().frame(height: 30)
            
            
            HStack{
            Text("Fields/Courts")
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer().frame(width: 5)
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 18){
                    
                    Button(action: {
                        
                    }) {}
                    ForEach(1...7,id: \.self){i in
                        
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
            .padding(.trailing, 10)
            }.padding(.leading, 10)
            
            Spacer().frame(height: 15)
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(0..<15) { value in
                        CourtsNearMeView(title: "🎾 State Gym", radius: "0.25", percentage: "100%", open: "open")
                            .frame(maxWidth: 180)
                }
                }
            }
            .padding(.horizontal, 10)
            
            
        }
    }
}

struct CourtsNearMeListView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeListView()
    }
}

