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
                    
                SearchBarView(text: $viewModel.query, placeholder: "Search")
                Spacer().frame(height: 10.0)
                List(viewModel.users) { user in
                    NavigationLink(
                        destination: ProfileView(viewModel: ProfileViewModel(userId: user.id), auth: false),
                        label: {
                            SearchItemView(id: user.id, username: user.username)
                        })
                }

            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                    Image("logo2")
                        .resizable()
                        .padding(.top, -15)
                        .frame(width: 125, height: 30)
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

