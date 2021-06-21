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
    @State private var eventAlert = false
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

            
            Spacer().frame(height: 35.0)
            
        HStack{
            HStack{
                Button(action: {
                    self.showPopUp.toggle()
                }, label: {
                Text("Invite Friends")
                .fontWeight(.heavy)
                    .foregroundColor(Color("Text"))
                    .padding(.all, 10.0)
                    .background(Color.green.opacity(0.8))
                    .cornerRadius(7)
            })
            }.sheet(isPresented: $showPopUp, content: {
            
            VStack{
            Spacer()
                
            //Check mark function needs to be replaced with selector, not "follower"
            FriendsListView(viewModel: MockFriendsListViewModel(userId: "1"))
    
            Spacer()
    
            Button(action: {
            self.showPopUp.toggle()
                },label: {
            Text("Invite")
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(Color.green.opacity(0.8))
            .cornerRadius(9)
            .padding(.horizontal, 20)
                }).padding()
            }
        })
            
            
            Spacer().frame(width: 17.5)
            
            HStack{
                Button(action: {
                    self.eventViewModel.createEvent()
                    self.eventAlert = true
                }) {
                Text("Create Pickup").fontWeight(.heavy)
                    .foregroundColor(Color("Text"))
                    .padding(.all, 10.0)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(7)

                }
                .alert(isPresented: $eventAlert) { () -> Alert in
                            let button = Alert.Button.default(Text("OK")) {
                                print("OK Button Pressed")
                            }
                            return Alert(title: Text("Congratuations, Pickup Was Created!"), message: Text(""), dismissButton: button)
                        }
            }
        }
        }
    }
}

struct CreateSportEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSportEventView().environmentObject(CreateEventViewModel())
    }
}

