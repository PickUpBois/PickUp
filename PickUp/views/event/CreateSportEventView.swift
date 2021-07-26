//
//  CreateSportEventView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/14/21.
//

import SwiftUI

struct CreateSportEventView: View {
    @EnvironmentObject var eventViewModel: CreateEventViewModel
    @State var invitePopUp = false
    @State var preferencesPopUp = false
    @State private var eventAlert = false
    @State var friendPopUp = false
    var body: some View {
        ZStack{
        VStack{
            // Stacks everything on page
           
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 18){
                    
                    Button(action: {
                        withAnimation{

                        }
                    }) {}
                    ForEach(1...16,id: \.self){i in
                        
                        Button(action: {
                        }) {
                            
                            Image("b\(i)")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 35, height: 35)
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
            
            Spacer().frame(height: 15)
            //Scroll Menu (Like when setting alarm on iPhone)
            
            //busyness meter??
            
            EventDatePickerView(date: self.$eventViewModel.eventInfo.startDate)
 
            
            Spacer().frame(height: 35.0)
            
        HStack{
//            HStack{
//                Button(action: {
//                    withAnimation{
//                    self.friendPopUp.toggle()
//                    }
//                }, label: {
//                Text("Invite Friends")
//                .fontWeight(.heavy)
//                    .foregroundColor(Color("Text"))
//                    .padding(.all, 10.0)
//                    .background(Color.green.opacity(0.8))
//                    .cornerRadius(7)
//            })
//            }
            
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
            //Spacer extends page to bottom of screen
            Spacer()
        }
            VStack{
            Spacer()
            Button(action: {
                self.invitePopUp.toggle()
            },label: {
                Image(systemName: "circlebadge.fill")
                    .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                    .foregroundColor(Color("Tabbar"))
                    .background(Circle().stroke(Color.white, lineWidth: 2))
                    .frame(width: 50, height: 50)
                    .overlay(Image(systemName: "person.crop.circle.fill.badge.plus").foregroundColor(Color("Text")))
                
            }).sheet(isPresented: $invitePopUp, content: {
                    
                    //PopUp for inviting friends
               
                })
                
            Spacer().frame(height: 10)
                
            Button(action: {
                self.preferencesPopUp.toggle()
            },label: {
                Image(systemName: "circlebadge.fill")
                    .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                    .foregroundColor(Color("Tabbar"))
                    .background(Circle().stroke(Color.white, lineWidth: 2))
                    .frame(width: 50, height: 50)
                    .overlay(Image(systemName: "text.badge.plus").foregroundColor(Color("Text")))

                
            }).sheet(isPresented: $preferencesPopUp, content: {
                
                PreferencesView()
                
                
            })
            }.padding(.leading, 330)
            .padding(.bottom, 20)
//        .opacity(self.friendPopUp ? 0.2: 1)
//                if self.friendPopUp {
//                    VStack(alignment:.center){
//                        ZStack{
//                        PopUpList()
//                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.6, alignment: .bottom)
//
//                            }
//                        .onTapGesture(perform: {
//                            withAnimation(.easeIn){self.friendPopUp.toggle()}
//                                })
//                        .background(Color("Friends_Popup_Background").edgesIgnoringSafeArea(.all))
//                                .cornerRadius(20)
//
//
//
//                        Button(action: {
//                        withAnimation{
//                            self.friendPopUp.toggle()
//                        }
//                    }) {
//                        Image(systemName: "plus.square.fill").resizable()
//                            .frame(width: 20, height: 20)
//                            .foregroundColor(Color.white)
//                            .padding(15)
//
//                    }
//                    .background(Color.green)
//                    .clipShape(Circle())
//                    .padding(.top, 5)
//                    }
//                }
            }
        }
    }
 
struct CreateSportEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSportEventView().environmentObject(CreateEventViewModel())
    }
}
