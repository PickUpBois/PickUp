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
    @State var alertStatus: AlertStatus? = nil
    enum AlertStatus {
        case invite(String)
        case cancelInvite(String)
    }
    
    
    func confirmInviteAlert(userId: String) -> Alert {
        Alert(title: Text("Confirm Invite"), message: Text("Invite this person?"), primaryButton: .default(Text("Yes")) {
            //Add Action for updating - Arian
            self.viewModel.inviteFriend(friendId: userId)
            alertStatus = nil
        }, secondaryButton: .destructive(Text("Cancel")) {
            alertStatus = nil
        })
    }
    
    func cancelInviteAlert(userId: String) -> Alert {
        Alert(title: Text("Confirm Cancel Invite"), message: Text("Remove this person's invitation?"), primaryButton: .default(Text("Yes")) {
            //Add Action for updating - Arian
            viewModel.cancelEventInvitation(friendId: userId)
            alertStatus = nil
        }, secondaryButton: .destructive(Text("Cancel")) {
            alertStatus = nil
        })
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
    
    
    func getActionButton(userId: String) -> some View {
        let status = getStatus(friendId: userId)
        return Group {
            switch status {
            case .invited:
                Button(action: {
                    self.alertStatus = .cancelInvite(userId)
                    }, label: {
                        Text("Invited: Cancel?")
                    })
            case .ok:
                Text("Joined")
            default:
                Button(action: {
                    self.alertStatus = .invite(userId)
                    }, label: {
                        Text("Invite")
                    })
            }
        }
    }
    
    var body: some View {
        let alertPresent: Binding<Bool> = Binding(get: {return alertStatus != nil}, set: { _ in })
        ScrollView {
            ForEach(self.friendsViewModel.friends.indices, id: \.self) { i in
                let friend = friendsViewModel.friends[i]
                HStack{
//                    WebImage(url: URL(string: friend.photoUrl ?? ""))
//                        .placeholder(Image("serena")
//                                        .resizable())
//                        .resizable()
//                        .indicator(.activity)
//                        .foregroundColor(.blue)
//                        .frame(width: 60, height: 60, alignment: .center)
//                        .clipShape(Circle())
//                        .shadow(radius: 2)
//                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
//                        .padding()
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
                                .frame(width: 60, height: 60, alignment: .center)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                .padding()
                        } else {
                            Image("placeholder")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 60, height: 60, alignment: .center)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                .padding()
                        }
                    }

                    VStack(alignment: .leading){
                    FriendItemView(id: friend.id, username: friend.username)
                        .frame(alignment: .leading)

                        HStack{
                            Text("\(friend.firstName) \(friend.lastName)")
                            .fontWeight(.light)
                            .foregroundColor(Color("Text"))

                        Spacer()

                            getActionButton(userId: friend.id)

                        }

//                            Text("69 mutual friends")
//                                .fontWeight(.light)

                    }.frame(width: 300, alignment: .leading)

                }.frame(alignment: .topLeading)
            }
        }
        .alert(isPresented: alertPresent) {
            switch alertStatus! {
            case .invite(let userId):
                return confirmInviteAlert(userId: userId)
            case .cancelInvite(let userId):
                return cancelInviteAlert(userId: userId)
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
