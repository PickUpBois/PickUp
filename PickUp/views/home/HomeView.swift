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
       ZStack{
            VStack{
//top, social media box
                Spacer().frame(height:15)
                SocialView()
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height * 0.4, alignment: .top)
                    .padding(.horizontal, 6.0)
                    .padding(.vertical, 15.0)
                    .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                    .cornerRadius(20)
                HStack {
                    //Bottom left, near me box
                    CourtsNearMeListView()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.45, maxHeight: UIScreen.main.bounds.height * 0.4, alignment: .top)
                        .padding(.vertical, 15.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(20)
                    
                    Spacer().frame(width: 8)
           
                    //Bottom Right, pickups near me
                    PickUpTabListView().environmentObject(viewModel)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.45, maxHeight: UIScreen.main.bounds.height * 0.4, alignment: .top)
                        .padding(.vertical, 15.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(20)
                        
                }
                Spacer().frame(height:15)
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
                    
                    Spacer().frame(minWidth: 80, idealWidth: 80, maxWidth: 80, alignment: .center)
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
