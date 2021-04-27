//
//  DataUser.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/18/21.
//

import Foundation
import FirebaseFirestoreSwift

struct DataUser: Codable {
    @DocumentID var id: String?
    var username: String
    var firstName: String
    var lastName: String
    var photoUrl: String? = nil
    
    init(user: User) {
        self.username = user.username
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.photoUrl = user.photoUrl
    }
    
    func toUser() -> User {
        return User(id: id!, username: username, firstName: firstName, lastName: lastName)
    }
    
    enum CodingKeys: String, CodingKey {
        case username
        case firstName
        case lastName
        case photoUrl
    }
}

extension Encodable {
  /// Returns a JSON dictionary, with choice of minimal information
  func getDictionary() -> [String: Any]? {
    let encoder = JSONEncoder()

    guard let data = try? encoder.encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any]
    }
  }
}

extension Decodable {
  /// Initialize from JSON Dictionary. Return nil on failure
  init?(dictionary value: [String:Any]){

    guard JSONSerialization.isValidJSONObject(value) else { return nil }
    guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []) else { return nil }

    guard let newValue = try? JSONDecoder().decode(Self.self, from: jsonData) else { return nil }
    self = newValue
  }
}
