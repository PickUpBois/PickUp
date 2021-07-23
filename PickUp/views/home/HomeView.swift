//
//  HomeView.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI
import Combine

struct HomeView: View {
    //@State private var selection = 1
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        ZStack{
            VStack {
                
                //Spacer().frame(height:15)
                
                PrivateView()
                
                //The tab selection will be expanded and included in a future update
                    
//                Picker("", selection: $selection) {
//                    Text("Teammates").foregroundColor(Color.blue).tag(1)
//
//                    Text("Trending").foregroundColor(Color.red).tag(0)
//                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
//
//                if selection == 1 {
//                    PrivateView()
//                }
//                //second picker option
//
//                else {
//                    PublicView()
//                }
            }
        }.navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                
                HStack(spacing: 0.0) {
                    
                NavigationLink(destination: MapMainView()) {
                        Image(systemName: "globe")
                            .resizable(capInsets: EdgeInsets(top: 0.5, leading: 0.5, bottom: 0.5, trailing: 0.5))
                            .foregroundColor(Color.green)
                            .frame(width: 25.0, height: 25.0)
                    Spacer().frame(minWidth: 100, idealWidth: 100, maxWidth: 100, alignment: .center)
                    }
                    
                    Image("logo")
                        .resizable()
                        .padding(.top, -5)
                        .frame(width: 130, height: 40)
                        .scaledToFit()
                    
                    Spacer().frame(minWidth: 65, idealWidth: 65, maxWidth: 65, alignment: .center)
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
                            .foregroundColor(Color("Notifications"))
                            .frame(width: 25.0, height: 25.0)
                        
                        Spacer().frame(minWidth: 110, idealWidth: 110, maxWidth: 110, alignment: .center)
                    }

                }
                .padding(.leading, 110)
            }
                
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MockHomeViewModel())
    }
}
