//
//  AuthRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/3/21.
//

import Foundation
import Combine
protocol AuthRepo {
    func login(email: String, password: String) -> AnyPublisher<String, Error>
    
    func signup(email: String, password: String) -> AnyPublisher<String, Error>
    
    func logout() -> AnyPublisher<Void, Error>
    
    func delete() -> AnyPublisher<Void, Error>
    
    func observeAuthState() -> CurrentValueSubject<String?, Never>
}
