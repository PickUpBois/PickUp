//
//  IFileRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/18/21.
//

import Foundation
import Combine

protocol IFileRepo {
    func upload(file: Data, path: String) -> AnyPublisher<String, Error>
    func download(url: URL) -> AnyPublisher<Data, Error>
    func delete(path: String) -> AnyPublisher<Void, Error>
}
