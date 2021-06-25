//
//  InviteFriendsView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/23/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct InviteFriendsView: View {
    @StateObject var viewModel: InviteFriendsViewModel
    @StateObject var friendsViewModel: FriendsListViewModel
    @State private var showingFollowAlert = false
    
    var confirmInviteAlert: Alert {
        Alert(title: Text("Confirm Invite"), message: Text("Invite this person?"), primaryButton: .default(Text("Yes")) {
            //Add Action for updating - Arian
        }, secondaryButton: .destructive(Text("Cancel")))
    }
    
    var cancelInviteAlert: Alert {
        Alert(title: Text("Confirm Cancel Invite"), message: Text("Remove this person's invitation?"), primaryButton: .default(Text("Yes")) {
            //Add Action for updating - Arian
        }, secondaryButton: .destructive(Text("Cancel")))
    }
    
    func getStatus(friendId: String) -> EventAttendeeStatus? {
        if viewModel.invitedUsers.contains(friendId) {
            return .invited
        }
        if viewModel.attendees.contains(friendId) {
            return .ok
        }
        return .none
    }
    
    var body: some View {
        ScrollView {
            ForEach(self.friendsViewModel.friends.indices, id: \.self) { i in
                let friend = friendsViewModel.friends[i]
                HStack{
                    WebImage(url: URL(string: friend.photoUrl ?? ""))
                        .placeholder(Image("serena")
                                        .resizable())
                        .resizable()
                        .indicator(.activity)
                        .foregroundColor(.blue)
                        .frame(width: 60, height: 60, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        .padding()

                    VStack(alignment: .leading){
                    FriendItemView(id: friend.id, username: friend.username)
                        .frame(alignment: .leading)

                        HStack{
                            Text("\(friend.firstName) \(friend.lastName)")
                            .fontWeight(.light)
                            .foregroundColor(Color("Text"))

                        Spacer()

                        Button(action: {
                                self.showingFollowAlert = true
                            }, label: {
                                Text("Join")
                            .alert(isPresented:$showingFollowAlert) {
                                Alert(title: Text("Confirm Follow!"), message: Text("Are you sure you want to add this person as a teammate?"), primaryButton: .default(Text("Yes")) {
                                    //Add Action for updating - Arian
                                }, secondaryButton: .destructive(Text("Cancel")))
                            }})

                        }

//                            Text("69 mutual friends")
//                                .fontWeight(.light)

                    }.frame(width: 300, alignment: .leading)

                }.frame(alignment: .topLeading)
            }
        }
        .onAppear(perform: {
            print("getting friends")
            self.friendsViewModel.getFriends()
            self.viewModel.getEvent()
    })
    .navigationTitle("Teammates")
    }
}

struct InviteFriendsView_Previews: PreviewProvider {
    static let event1 = EventDetails(id: "1", name: "event", info: "info", capacity: 4, attendees: [], startDate: Date().isoString, type: .tennis, status: .open)
    static var previews: some View {
        InviteFriendsView(viewModel: MockInviteFriendsViewModel(event: event1), friendsViewModel: MockFriendsListViewModel(userId: "1"))
    }
}
