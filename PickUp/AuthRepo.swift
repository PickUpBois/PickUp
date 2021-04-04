//
//  AuthRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/3/21.
//

import Foundation
import Combine
protocol AuthRepo {
    func login(email: String, password: String) -> Future<Bool, Error>
}
