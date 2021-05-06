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
                Spacer()
                    
                Picker("", selection: $selection) {
                    Text("🏀").foregroundColor(Color.blue).tag(0)
                    Text("🎾").foregroundColor(Color.red).tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)

                   
                    if selection == 0 {
                        
                        CreateBasketballEventView()
                        }
                    //second picker option
                    
                    else {
                            CreateTennisEventView()
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
