//
//  NotificationViewModel.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/27/21.
//

import Foundation

class NotificationViewModel: ObservableObject {
    func getNotifications() {
        Services.shared.apollo.fetch(query: GetNotificationsQuery(userId: AppState.shared.authId!)) { response in
            switch response {
            case .success(let result):
                if let errors = result.errors {
                    print(errors[0].localizedDescription)
                }
                guard let data = result.data else {
                    print("data is null")
                    return
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
