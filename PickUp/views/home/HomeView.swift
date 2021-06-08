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
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
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
            self.viewModel.getNotifications()
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
                    
                    Spacer().frame(minWidth: 70, idealWidth: 70, maxWidth: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    NavigationLink(destination: MessageView()) {
                        Image(systemName: "message.circle.fill")
                            .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                            .foregroundColor(Color.blue)
                            .frame(width: 25.0, height: 25.0)
                    }
                    Spacer().frame(width: 10)
                    
                    NavigationLink(destination: NotificationListView(viewModel: NotificationListViewModel())) {
                        Image(systemName: "bell.circle.fill")
                            .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                            .foregroundColor(Color.black)
                            .frame(width: 25.0, height: 25.0)
                    }

                }
                .padding(.leading, 140)
            }
                
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MockHomeViewModel())
    }
}
