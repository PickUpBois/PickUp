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
                Button(action: {
                    self.showPopUp.toggle()
                }, label: {
                Text("Courts Near Me")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                            
            Image(systemName:"location.fill")
                    .foregroundColor(Color.blue)
                        })
                }.sheet(isPresented: $showPopUp, content: {
        
                    CourtsNearByScrollView()
        
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
            
                
            ScrollView {
                ForEach(0..<4) { _ in
                    CourtsNearMeView(title: "example", radius: "0.25", available: "🎾 2", total: "4", open: "open")
                }
            }
        }
            .frame(width: 175.0, height: 330.0, alignment: .top).padding(.horizontal, 9)
            .padding(.vertical, 15.0)
            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
            .cornerRadius(20)
    }
}

struct CourtsNearMeListView_Previews: PreviewProvider {
    static var previews: some View {
        CourtsNearMeListView()
    }
}
