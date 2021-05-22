//
//  HomeView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI
import Combine

struct HomeView: View {
    @State var menuOpen: Bool = false
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer().frame(height:15)
                VStack{
    //top, social media box
                    
                    SocialView()
                        .frame(width: 375.0, height: 330.0, alignment: .top)
                        .padding(.horizontal, 6.0)
                        .padding(.vertical, 15.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(20)
                    HStack {
                        //Bottom left, near me box
                        CourtsNearMeListView()
                        Spacer().frame(width: 7)
               
                        //Bottom Right, pickups near me
                        PickUpTabListView().environmentObject(viewModel)
                            .frame(width: 175.0, height: 330.0, alignment: .top)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 15.0)
                            .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                            .cornerRadius(20)
                            
                    }
                }
                .frame(alignment: .topLeading)
                    
            }
            .onAppear(perform: {
                self.viewModel.getUpcomingEvents()
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 0.0) {
                        Image("logo2")
                            .resizable()
                            .padding(.top, -15)
                            .frame(width: 125, height: 30)
                            .scaledToFit()
                        
                        Spacer().frame(minWidth: 95, idealWidth: 95, maxWidth: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        NavigationLink(destination: NotificationsView()) {
                            Image(systemName: "bell.circle.fill")
                            
                        }

                    }
                    .padding(.leading, 115)
                                }
                    
                        }
                }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MockHomeViewModel())
    }
}
