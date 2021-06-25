//
//  NotificationsView.swift
//  PickUp
//
//  Created by David Reynolds on 5/20/21.
//

import SwiftUI

struct NotificationListView: View {
    @State var showPopUp = false
    @ObservedObject var viewModel: NotificationListViewModel
    @State var mvpPopUp: Bool = false
    @State var selectedViewModel: NotificationViewModel? = nil
    init(viewModel: NotificationListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
        ScrollView {
            ForEach(self.viewModel.notifications.indices, id: \.self) { i in
                let notificationViewModel = self.viewModel.notifications[i]
                switch self.viewModel.notifications[i].type {
                case .friendRequestSend:
                    FriendRequestNotificationView(viewModel: notificationViewModel)
                case .friendRequestAccept:
                    FriendRequestResponseNotificationView(viewModel: notificationViewModel)
                case .friendRequestReject:
                    FriendRequestResponseNotificationView(viewModel: notificationViewModel)
                case .finishEvent:
                    FinishPickupNotificationView(viewModel: notificationViewModel)
                case .voteForMvp:
                    ConfirmationNotificationView(viewModel: notificationViewModel, mvpPopUp: $mvpPopUp, selectedViewModel: $selectedViewModel)
                case .selectedMvp:
                    VotedForMvpNotificationView(viewModel: notificationViewModel)
                case .leftEvent:
                    LeftEventNotificationView(viewModel: notificationViewModel)
                case .deletedEvent:
                    DeletedEventNotificationView(viewModel: notificationViewModel)
                case .eventInvitation:
                    EventInvitationNotificationView(viewModel: notificationViewModel)
                default:
                    Text("Error")
                }
            }
                
            if self.mvpPopUp {
                VStack(alignment:.center){
                    ZStack{
                        FinishPickupView(showPopUp: $mvpPopUp, viewModel: selectedViewModel!)
                            .background(Color("Background_SmallView"))
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.6, alignment: .bottom)
                            .padding(.vertical, 10.0)
                            .padding(.horizontal, 10)
                
                        }.background(Color("Friends_Popup_Background").edgesIgnoringSafeArea(.all))
                            .cornerRadius(20)
                
                    Button(action: {
                    withAnimation{
                        self.mvpPopUp.toggle()
                    }
                }) {
                    Image(systemName: "x.circle.fill").resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("Text"))
                        .padding(15)
                
                }
                .clipShape(Circle())
                .padding(.top, 5)
                }.onTapGesture(perform: {
                    withAnimation(.easeIn){
                        self.mvpPopUp = false}
                        })
                
            }
        }
        
        }
        .onAppear {
            self.viewModel.getNotifications()
        }
        .frame(width: .infinity, height: .infinity, alignment: .topLeading)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    Text("Notifications")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Text"))
                }
            }
        }
    }
}


struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView(viewModel: MockNotificationListViewModel())
    }
}
