//
//  HomeView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI
import Combine

struct HomeView: View {
    @State private var selection = 1
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        VStack {
            
            Spacer().frame(height:15)
            
//            Button(action: {
//            }) {
//            Text("Create Post").fontWeight(.heavy)
//                .foregroundColor(Color("Text"))
//                .padding(.vertical, 5)
//                .padding(.horizontal, 140)
//                .background(Color.blue.opacity(0.8))
//                .cornerRadius(7)
//
//            }
//
//            Spacer().frame(height: 5)
                
            Picker("", selection: $selection) {
                Text("Teammates").foregroundColor(Color.blue).tag(1)
                
                Text("Trending").foregroundColor(Color.red).tag(0)
            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            
            if selection == 1 {
                PrivateView()
            }
            //second picker option
            
            else {
                PublicView()
            }
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MockHomeViewModel())
    }
}
