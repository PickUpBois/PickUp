//
//  EditPickupView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/22/21.
//

import SwiftUI

struct EditPickupView: View {
    @Binding var deletePickupAlert: Bool
    @Binding var updatePickupAlert: Bool
    let viewModel: EventDetailsBoxViewModel
    var body: some View {
        VStack {
            EventDetailsBoxView(event: viewModel.event, viewModel: EventDetailsBoxViewModel(event: viewModel.event))

        Spacer().frame(height: 10)
         
            HStack{
                Button(action: {
                    self.deletePickupAlert = true
                }, label: {
                Text("Delete")
                .fontWeight(.heavy)
                    .foregroundColor(Color("Text"))
                    .padding(.all, 10.0)
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(7)
                    .alert(isPresented:$deletePickupAlert) {
                        Alert(title: Text("Confirm Delete Event"), message: Text("Are you sure you want to delete this Pickup?"), primaryButton: .default(Text("Yes")) {
                            //Add Action for deleting - Arian
                            self.viewModel.deleteEvent(eventId: viewModel.event.id)
                        }, secondaryButton: .destructive(Text("Cancel")))
                    }})
                
                
        Spacer().frame(width: 140)
                
                Button(action: {
                    self.updatePickupAlert = true
                }, label: {
                    Text("Update")
                    .fontWeight(.heavy)
                        .foregroundColor(Color("Text"))
                        .padding(.all, 10.0)
                        .background(Color.green.opacity(0.8))
                        .cornerRadius(7)
                        .alert(isPresented:$updatePickupAlert) {
                            Alert(title: Text("Confirm Update Event"), message: Text("Are you sure you want to update this Pickup?"), primaryButton: .default(Text("Yes")) {
                                //Add Action for updating - Arian
                            }, secondaryButton: .destructive(Text("Cancel")))
                        }})
            }

            }
    }
}

struct EditPickupView_Previews: PreviewProvider {
    static let event1 = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: [], startDate: Date().isoString, type: .tennis, status: .open)
    static var previews: some View {
        EditPickupView(deletePickupAlert: .constant(false), updatePickupAlert: .constant(false), viewModel: EventDetailsBoxViewModel(event: event1))
    }
}
