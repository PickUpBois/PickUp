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
        VStack {
        // Stacks everything on page
            Spacer().frame(height: 10.0)
                VStack(alignment: .leading){
                    
                    SearchBarView(text: $viewModel.query, placeholder: "Search").frame(alignment: .top)
                Spacer().frame(height: 10.0)
                
                Group {
                    switch viewModel.state {
                    case .idle:
                        Color.clear
                    case .loading:
                        VStack {
                            ProgressView()
                        }.frame(alignment: .center)
                    case .success, .error:
                        List(viewModel.users) { user in
                            NavigationLink(
                                destination: ProfileView(viewModel: ProfileViewModel(userId: user.id), auth: false),
                                label: {
                                    SearchItemView(id: user.id, username: user.username)
                                })
                        }.frame(alignment: .top)
                    }
                }

            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                    Image("logo")
                        .resizable()
                        .padding(.top, -5)
                        .frame(width: 130, height: 40)
                        .scaledToFit()
            }

        }
    }
}
        
struct FindTeammatesView_Previews: PreviewProvider {
    static var previews: some View {
        FindTeammatesView(viewModel: MockFindTeammatesViewModel())
    }
}

