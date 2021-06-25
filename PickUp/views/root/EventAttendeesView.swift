//
//  EventAttendeesView.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/24/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventAttendeesView: View {
    @State private var showingFollowAlert = false
    @StateObject var viewModel: EventAttendeesViewModel
    var body: some View {
        ScrollView {
            ForEach(self.viewModel.attendees.indices, id: \.self) { i in
                let attendee = self.viewModel.attendees[i]
                HStack{
                    Group {
                        if attendee.photoUrl != nil {
                            WebImage(url: URL(string: attendee.photoUrl ?? ""))
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
                        FriendItemView(id: attendee.id, username: attendee.username)
                        .frame(alignment: .leading)

                        HStack{
                        Text("\(attendee.firstName) \(attendee.lastName)")
                        .fontWeight(.light)
                        .foregroundColor(Color("Text"))

//                        Spacer()
//
//                        Button(action: {
//                                self.showingFollowAlert = true
//                            }, label: {
//                                Image(systemName: "checkmark.square.fill")
//                                        .foregroundColor(Color.green)
//                            .alert(isPresented:$showingFollowAlert) {
//                                Alert(title: Text("Confirm Follow!"), message: Text("Are you sure you want to add this person as a teammate?"), primaryButton: .default(Text("Yes")) {
//                                    //Add Action for updating - Arian
//                                }, secondaryButton: .destructive(Text("Cancel")))
//                            }})

//                        }

//                            Text("69 mutual friends")
//                                .fontWeight(.light)

                        }.frame(width: 300, alignment: .leading)

                    }
                }.frame(alignment: .topLeading)
            }
        }
        .toolbar {
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

struct EventAttendeesView_Previews: PreviewProvider {
    static var previews: some View {
        EventAttendeesView(viewModel: MockEventAttendeesViewModel())
    }
}