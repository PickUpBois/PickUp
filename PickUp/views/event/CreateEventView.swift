//
//  CreateEventView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI
import Combine

struct CreateEventView: View {
    @ObservedObject var viewModel: CreateEventViewModel
    @State private var selection = 1
    init(viewModel: CreateEventViewModel = CreateEventViewModel())
    {
        self.viewModel = viewModel
    }
    
    var body: some View {
            ScrollView {
                Spacer().frame(height:15)
                    
                Picker("", selection: $selection) {
                    Text("Create Event").foregroundColor(Color.blue).tag(1)
                    
                    Text("Edit Your Pickup").foregroundColor(Color.red).tag(0)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                
                if selection == 1 {
                    CreateSportEventView().environmentObject(self.viewModel)
                }
                //second picker option
                
                else {
                    EditPickupView()
                }

                    
            }.navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("logo")
                            .resizable()
                            .padding(.top, -5)
                            .frame(width: 130, height: 40)
                            .scaledToFit()
                            
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
