//
//  CreateEventView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct CreateEventView: View {
    @State private var selection = 1
    @State var menuOpen: Bool = false
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    
    var body: some View {

        NavigationView {
            ScrollView {
                Spacer().frame(height:15)
                    
                Picker("", selection: $selection) {
                    Text("🎾").foregroundColor(Color.blue).tag(1)
                    
                    Text("🏀").foregroundColor(Color.red).tag(0)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)

                   
                    if selection == 1 {
                        
                        CreateTennisEventView()
                        }
                    //second picker option
                    
                    else {
                            CreateBasketballEventView()
                         }
                    
            }.navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("logo2")
                            .resizable()
                            .padding(.top, -15)
                            .frame(width: 125, height: 30)
                            .scaledToFit()
                    }
                }
                    
            }
                }
    }
}




struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
