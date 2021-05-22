//
//  SearchBar.swift
//  Tabbar
//
//  Created by David Reynolds on 4/12/21.
//

import SwiftUI

struct FindTeammatesView: View {
    var body: some View {
        NavigationView {
                    ScrollView {
                    // Stacks everything on page
                        Spacer().frame(height: 10.0)
                        VStack(alignment: .leading){
                            
                            HStack(){
                            HStack{
                                Image(systemName: "magnifyingglass.circle.fill")
                                
                                    .multilineTextAlignment(.leading)
                                
                            Text("Search")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .frame(width: 60.0)
                                Spacer(minLength: 200)
                                    
                                Image(systemName: "x.circle.fill")
                                    .frame(width: 25.0)
                                    
                            }.frame(width: 320).padding(.horizontal, 6.0)
                            .padding(.vertical, 15.0)
                        .background(Color(red: 0.68, green: 0.8, blue: 0.9, opacity: 0.2))
                        .cornerRadius(20)
                            
                                Text("Cancel")
                            }


                            
                        //Email Text Field Settings


                        }
                        
                            }.navigationBarTitleDisplayMode(.inline)
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
        struct FindTeammatesView_Previews: PreviewProvider {
            static var previews: some View {
                FindTeammatesView()
            }
        }

