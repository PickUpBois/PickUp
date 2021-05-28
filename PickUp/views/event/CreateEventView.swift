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
    init(viewModel: CreateEventViewModel = CreateEventViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            ScrollView {
                Spacer().frame(height:15)
                    
                Picker("", selection: self.$viewModel.eventInfo.eventType) {
                    Text("🎾").foregroundColor(Color.blue).tag(EventType.tennis)
                    
                    Text("🏀").foregroundColor(Color.red).tag(EventType.basketball)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)

                CreateSportEventView().environmentObject(self.viewModel)
                    
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


struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
