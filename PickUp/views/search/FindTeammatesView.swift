//
//  SearchBar.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

extension SearchUsersQuery.Data.SearchUser: Identifiable {
    
}

struct FindTeammatesView: View {
    @StateObject var viewModel: FindTeammatesViewModel = FindTeammatesViewModel()
    var body: some View {
        ZStack {
            // Stacks everything on page
            VStack(spacing: 0) {
//                VStack {
//                    Spacer().frame(height: 10.0)
//                    VStack {
                        SearchBarView(text: $viewModel.query, placeholder: "Search...")
//                        Spacer().frame(height: 10.0)
//                    }
                    
//                    Spacer()
//                }.frame(alignment: .top)
                
                Spacer().frame(height: 5)
                
                Spacer()
                            
                Group {
                    switch viewModel.state {
                    case .idle:
                        Color.clear
                    case .loading:
                        ProgressView()
                        Spacer()
                    default:
                        ScrollView{
                            VStack(spacing: 15){
                                
                                ForEach(viewModel.users) { user in
                                    NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(userId: user.id), auth: false)) {
                                        SearchItemView(id: user.id, username: user.username)
                                            .foregroundColor(Color("Text"))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading)
                                    }
                                }
                            }
                            .padding(.top)
                        }
                        .background(Color("SearchBarBackground"))
                    }
                }
            }.padding()
                    
        }.navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("logo")
                        .resizable()
                        .padding(.top, -5)
                        .frame(width: 130, height: 40)
                        .scaledToFit()
                }
            }
        }
    }
}
        
struct FindTeammatesView_Previews: PreviewProvider {
    static var previews: some View {
        FindTeammatesView(viewModel: MockFindTeammatesViewModel())
    }
}

