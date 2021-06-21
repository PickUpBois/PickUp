//
//  EditPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 6/3/21.
//

import SwiftUI

struct EditPickupView: View {
    
    @ObservedObject var viewModel: EditPickUpViewModel = MockEditPickupViewModel()
    @State private var updatePickupAlert = false
    @State private var deletePickupAlert = false
    var body: some View {
        ScrollView {
            ForEach(self.viewModel.events, id: \.self.id) { event in
                Spacer().frame(height: 15)
                VStack {
                    EventDetailsBoxView(event: event, joinEvent: { _ in return})

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

                    }.padding(.all, 25.0)
                .background(Color("Background_Events"))
                .cornerRadius(8)
                .padding(.horizontal, 20)
                }
            }
            }
        
    }

struct EditPickUpView_Previews: PreviewProvider {
    static var previews: some View {
        EditPickupView()
    }
}
