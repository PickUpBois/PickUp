//
//  Network.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/15/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)
}
