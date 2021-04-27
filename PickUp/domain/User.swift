//
//  User.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/17/21.
//

import Foundation

class User {
    var id: String?
    var username: String
    var firstName: String
    var lastName: String
    var photoUrl: String?
    
    init(id: String? = nil, username: String, firstName: String, lastName: String, photoUrl: String? = nil) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.photoUrl = photoUrl
    }
    
    func toUserAuth(email: String, isEmailVerified: Bool) -> UserAuth {
        return UserAuth(id: id, username: username, firstName: firstName, lastName: lastName, email: email, isEmailVerified: isEmailVerified, photoUrl: photoUrl)
    }
}

class UserAuth: User {
    var email: String
    var isEmailVerified: Bool
    
    init(id: String? = nil, username: String, firstName: String, lastName: String, email: String, isEmailVerified: Bool, photoUrl: String? = nil) {
        self.email = email
        self.isEmailVerified = isEmailVerified
        super.init(id: id, username: username, firstName: firstName, lastName: lastName, photoUrl: photoUrl)
    }
}
