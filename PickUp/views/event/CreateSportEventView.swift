//
//  CreateSportEventView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/14/21.
//

import SwiftUI

struct CreateSportEventView: View {
    @EnvironmentObject var eventViewModel: CreateEventViewModel
    @State var showPopUp = false
    var body: some View {
        VStack{
            // Stacks everything on page
           
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 18){
                    
                    Button(action: {
                        
                    }) {}
                    ForEach(1...16,id: \.self){i in
                        
                        Button(action: {
                        }) {
                            
                            Image("b\(i)")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .padding()
            
            //Name //e.g. King of the Court
            TypingBlockView(title: "Name", description: "e.g. King of the Court", value: self.$eventViewModel.eventInfo.name)
         
            //Description //e.g. Casual Tennis Match
            TypingBlockView(title: "Info", description: "e.g. casual pickup game", value: self.$eventViewModel.eventInfo.info)
            
            //Location //e.g. Dave's Backyard
            EventLocationPickerView(value: self.$eventViewModel.eventInfo.locationId)
            
           
            //People //e.g. 4 (doubles)
            TypingBlockView(title: "People", description: "e.g. 4 (doubles)", value: self.$eventViewModel.eventInfo.capacity)
            Spacer().frame(height: 20)
            //Scroll Menu (Like when setting alarm on iPhone)
            
            //busyness meter??
            
            EventDatePickerView(date: self.$eventViewModel.eventInfo.startDate)
            
            
        Spacer().frame(height: 15.0)
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Invite Friends")
                .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding(.all, 10.0)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                    .background(Color(red: 0, green: 0.7, blue: 0, opacity: 0.55))
                    .cornerRadius(7)
            })
            Spacer().frame(width: 17.5)
            
            HStack{
                Button(action: {
                        self.eventViewModel.createEvent()
                        self.showPopUp.toggle()}
                   ,label: {
                Text("Create Pickup").fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding(.all, 10.0)      .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 1))
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
            })
            }.sheet(isPresented: $showPopUp, content: {
            
                Text("Your Pickup Event has been created!").fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding(.all, 50.0)      .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                    .background(Color.white.opacity(1))
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                
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
                
                Spacer().frame(height: 300)
                    .background(BackgroundClearView())
            })
            
            }
        }
    }
}

struct CreateSportEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSportEventView().environmentObject(CreateEventViewModel())
    }
}

