//
//  EditPickupView.swift
//  PickUp
//
//  Created by Ashwin Yedavalli on 6/3/21.
//

import SwiftUI

struct EditPickupListView: View {
    
    @ObservedObject var viewModel: EditPickUpListViewModel
    @State private var updatePickupAlert = false
    @State private var deletePickupAlert = false
    @State var friendPopUp: Bool = false
    @State var selectedEvent: EventDetails? = nil
    var body: some View {
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear {
                viewModel.getEvents()
                viewModel.friendsListViewModel.getFriends()
            }
        case .loading:
            Spacer().frame(height: 15)
            ProgressView()
        case .success, .fail:
            ScrollView {
                ForEach(self.viewModel.events, id: \.self.id) { event in
                    Spacer().frame(height: 15)
                    let eventViewModel = EventDetailsBoxViewModel(event: event, refresh: viewModel.getEvents)
                    EditPickupView(deletePickupAlert: $deletePickupAlert, updatePickupAlert: $updatePickupAlert, selectedEvent: $selectedEvent, friendPopUp: $friendPopUp, viewModel: eventViewModel)
                        .padding(.all, 25.0)
                    .background(Color("Background_Events"))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                }
            }
            .opacity(self.friendPopUp ? 0.2: 1)
                    if self.friendPopUp {
                        VStack(alignment:.center){
                            ZStack{
                                VStack(alignment: .center){
                                    InviteFriendsView(viewModel: InviteFriendsViewModel(event: selectedEvent!), friendsViewModel: FriendsListViewModel(userId: AppState.shared.authId!)).scaleEffect(0.7)
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.6, alignment: .bottom)
                            
                                }
                            .onTapGesture(perform: {
                                withAnimation(.easeIn){self.friendPopUp.toggle()}
                                    })
                            .background(Color("Friends_Popup_Background").edgesIgnoringSafeArea(.all))
                                    .cornerRadius(20)
                            
                            
                            
                            Button(action: {
                            withAnimation{
                                self.friendPopUp.toggle()
                            }
                        }) {
                            Image(systemName: "plus.square.fill").resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.white)
                                .padding(15)

                        }
                        .background(Color.green)
                        .clipShape(Circle())
                        .padding(.top, 5)
                        }
                    }
        }
            }
        
    }

struct EditPickUpListView_Previews: PreviewProvider {
    static var previews: some View {
        EditPickupListView(viewModel: MockEditPickupListViewModel())
    }
}
