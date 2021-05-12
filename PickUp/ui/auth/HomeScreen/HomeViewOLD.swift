//
//  HomeViewOLD.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 5/11/21.
//

import SwiftUI

struct HomeViewOLD: View {
    
    @State private var selection = 1
    @State var menuOpen: Bool = false
    @StateObject var observeAuthUseCase: ObserveAuthState = ObserveAuthState.shared
    
    var body: some View {
            NavigationView {
                ScrollView {
                    Spacer().frame(height:15)
                    HStack{
                    
        //top, social media box
                    HStack{
                Text("Social Feed")
                    .font(.title3)
                    .fontWeight(.bold)
                    }.frame(width: 175.0, height: 750.0, alignment: .top).padding(.horizontal, 6.0)
                .padding(.vertical, 15.0)
                .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                .cornerRadius(20)
         
                        
        //Top right, near me box
            VStack{
                        VStack{
                Text("Courts Near Me")
                    .font(.title3)
                    .fontWeight(.bold)
                                
                        }.frame(width: 175.0, height: 355.0, alignment: .top).padding(.horizontal, 6.0)
                        .padding(.vertical, 15.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(20)
                        
                Spacer().frame(height: 5)
       
        //Bottom Right, pickups near me
                        VStack{
                Text("Pickups Near Me")
                    .font(.title3)
                    .fontWeight(.bold)

            Spacer().frame(height:5)
                            
                Picker("", selection: $selection) {
                    Text("🎾").foregroundColor(Color.blue).tag(0)
                    Text("🏀").foregroundColor(Color.red).tag(1)}.pickerStyle(SegmentedPickerStyle())
                        
                        }.frame(width: 175.0, height: 360.0, alignment: .top).padding(.horizontal, 6.0)
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

struct HomeViewOLD_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
