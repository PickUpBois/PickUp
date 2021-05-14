//
//  HomeView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct HomeView: View {
    @State private var showPopUp = false
    @State private var selection = 1
    @State var menuOpen: Bool = false
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    
    var body: some View {
            NavigationView {
                ScrollView {
                    Spacer().frame(height:15)
                    VStack{
                    
        //top, social media box
                    VStack{
                        HStack{ Text("Social Feed")
                    .font(.title3)
                            .fontWeight(.bold)
                            Image(systemName:"newspaper.fill")
                                .foregroundColor(Color.green)
                        }
                        
                        ScrollView{
                            SocialView()}
                    
                    }.frame(width: 375.0, height: 330.0, alignment: .top).padding(.horizontal, 6.0)
                .padding(.vertical, 15.0)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                .cornerRadius(20)
         
                        
        //Bottom left, near me box
            HStack{
                        VStack{
            HStack{ Text("Courts Near Me")
                    .font(.title3)
                .fontWeight(.semibold)
                                
                Image(systemName:"location.fill")
                        .foregroundColor(Color.blue)
                            }
            ScrollView{
                CourtsNearMeView(title: "State Gym", radius: "0.25",available: "🏀 2", total: "4", open: "open")
                
                CourtsNearMeView(title: "Lied Rec Center", radius: "1", available: "🏀 20", total: "20", open: "closed")
                
                CourtsNearMeView(title: "Forker Tennis Courts", radius: "1", available: "🎾 4", total: "8", open: "open")
                
                CourtsNearMeView(title: "Dunlap HS Courts", radius: "300", available: "🎾 8", total: "8", open: "open")
        
            }
                        }.frame(width: 175.0, height: 330.0, alignment: .top).padding(.horizontal, 9)
                        .padding(.vertical, 15.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(20)
                        
                Spacer().frame(width: 7)
       
        //Bottom Right, pickups near me
                    VStack{
                        HStack{Text("Pickups Nearby").font(.title3)
                            .fontWeight(.semibold)
                    Image(systemName: "calendar").font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color.red)}

            Spacer().frame(height:5)
                            
                Picker("", selection: $selection) {
                    Text("🎾").foregroundColor(Color.blue).tag(1)
                    Text("🏀").foregroundColor(Color.red).tag(0)}.pickerStyle(SegmentedPickerStyle())
                        
            Spacer().frame(height: 2)
                        HStack(alignment: .center){
                            Button(action: {
                                self.showPopUp.toggle()
                            }, label: {
                                Text("More Details?")
                                    .foregroundColor(Color.purple)
                                
                            })
                                
                            }.sheet(isPresented: $showPopUp, content: {
                                Button(action: {
                                    self.showPopUp.toggle()
                                },label: {
                                    Text("Dismiss")
                                })
                            })
                   
                        ScrollView{
                        
                    if selection == 1 {
                                
                    TennisPickupView()
                                }
                //second picker option
                            
                    else {

                    BasketballPickupView()
                                }
                            
                        }
                        }.frame(width: 175.0, height: 330.0, alignment: .top).padding(.horizontal, 9)
                    .padding(.vertical, 15.0)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(20)
                    
            }
            }.frame(alignment: /*@START_MENU_TOKEN@*/.topLeading/*@END_MENU_TOKEN@*/)
                        
                }
.navigationBarTitleDisplayMode(.inline)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
