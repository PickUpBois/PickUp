//
//  FriendsListView.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/30/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FriendsListView: View {
    @StateObject var viewModel: FriendsListViewModel
    @State private var showingFollowAlert = false
    var body: some View {
            ScrollView {
                ForEach(self.viewModel.friends.indices, id: \.self) { i in
                    let friend = self.viewModel.friends[i]
                    HStack{
//                    Image("serena")
//                        .resizable()
//                        .foregroundColor(.blue)
//                        .frame(width: 60, height: 60, alignment: .center)
//                        .clipShape(Circle())
//                        .shadow(radius: 2)
//                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
//                        .padding()
//                        WebImage(url: URL(string: friend.photoUrl ?? ""))
//                            .placeholder(Image("serena")
//                                            .resizable())
//                            .resizable()
//                            .indicator(.activity)
//                            .foregroundColor(.blue)
//                            .frame(width: 60, height: 60, alignment: .center)
//                            .clipShape(Circle())
//                            .shadow(radius: 2)
//                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
//                            .padding()
                        Group {
                            if friend.photoUrl != nil {
                                WebImage(url: URL(string: friend.photoUrl ?? ""))
                                    .resizable()
                                    .placeholder {
                                        Rectangle()
                                            .foregroundColor(.gray)
                                        }
                                    .indicator(.activity)
                                    .foregroundColor(.blue)
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .clipShape(Circle())
                                    .shadow(radius: 2)
                                    .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                                    .padding(.trailing, 20)
                                    .padding(.leading, 10)
                                    .padding(.vertical, 10)
                            } else {
                                Image("placeholder")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .clipShape(Circle())
                                    .shadow(radius: 2)
                                    .overlay(Circle().stroke(Color("ColorThicknessPhoto")))
                                    .padding(.trailing, 20)
                                    .padding(.leading, 10)
                                    .padding(.vertical, 10)
                            }
                        }

                        VStack(alignment: .leading){
                        FriendItemView(id: friend.id, username: friend.username)
                            .frame(alignment: .leading)
                            .font(.subheadline)

                            HStack{
                                Text("\(friend.firstName) \(friend.lastName)")
                                .fontWeight(.light)
                                .font(.subheadline)
                                .foregroundColor(Color("Text"))

//                            Spacer()
//
//                            Button(action: {
//                                    self.showingFollowAlert = true
//                                }, label: {
//                                    Image(systemName: "checkmark.square.fill")
//                                            .foregroundColor(Color.green)
//                                .alert(isPresented:$showingFollowAlert) {
//                                    Alert(title: Text("Confirm Follow!"), message: Text("Are you sure you want to add this person as a teammate?"), primaryButton: .default(Text("Yes")) {
//                                        //Add Action for updating - Arian
//                                    }, secondaryButton: .destructive(Text("Cancel")))
//                                }})

                            }

//                            Text("69 mutual friends")
//                                .fontWeight(.light)

                        }.frame(width: 300, alignment: .leading)

                    }.frame(alignment: .topLeading)
                }
            }.padding(.top, 20)
            .onAppear(perform: {
            self.viewModel.getFriends()
        })
        .navigationTitle("Teammates")
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(viewModel: MockFriendsListViewModel(userId: "1"))
    }
}
