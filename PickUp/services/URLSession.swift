//
//  URLSession.swift
//  PickUp
//
//  Created by Arian Rahbar on 8/2/21.
//

import Foundation

class Session {
    private var config: URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        return config
    }
    lazy var shared = URLSession(configuration: config)
}
