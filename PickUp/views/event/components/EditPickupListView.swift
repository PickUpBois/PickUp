//
//  EditPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 6/3/21.
//

import SwiftUI

struct EditPickupListView: View {
    
    @ObservedObject var viewModel: EditPickUpListViewModel = MockEditPickupListViewModel()
    @State private var updatePickupAlert = false
    @State private var deletePickupAlert = false
    var body: some View {
        ScrollView {
            ForEach(self.viewModel.events, id: \.self.id) { event in
                Spacer().frame(height: 15)
                let eventViewModel = EventDetailsBoxViewModel(event: event)
                EditPickupView(deletePickupAlert: $deletePickupAlert, updatePickupAlert: $updatePickupAlert, viewModel: eventViewModel)
                    .padding(.all, 25.0)
                .background(Color("Background_Events"))
                .cornerRadius(8)
                .padding(.horizontal, 20)
                }
            }
            }
        
    }

struct EditPickUpListView_Previews: PreviewProvider {
    static var previews: some View {
        EditPickupListView()
    }
}
