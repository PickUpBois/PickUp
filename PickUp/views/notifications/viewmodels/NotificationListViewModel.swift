//
//  NotificationListViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/7/21.
//

import Foundation

class NotificationListViewModel: ObservableObject {
    @Published var notifications: [NotificationViewModel] = []
    
    func getNotifications() {
        if AppState.shared.authId != nil {
            Services.shared.apollo.fetch(query: GetNotificationsQuery(userId: AppState.shared.authId!), cachePolicy: .fetchIgnoringCacheCompletely) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0].localizedDescription)
                    }
                    guard let data = result.data else {
                        print("error in graphql query")
                        return
                    }
                    self.notifications = data.user.notifications.map { notification in
                        return NotificationViewModel(notificationId: notification.id, type: notification.type, timestamp: notification.createdAt.dateFromIso!, event: notification.event?.fragments.eventDetails ?? nil, actor: notification.actor?.fragments.userDetails ?? nil, getNotifications: self.getNotifications)
                    }
                    print(self.notifications)
                    self.objectWillChange.send()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}

class MockNotificationListViewModel: NotificationListViewModel {
    override init() {
        super.init()
        self.notifications = [MockNotificationViewModel()]
    }
    
    override func getNotifications() {
        
    }
}
