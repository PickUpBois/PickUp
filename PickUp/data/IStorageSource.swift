//
//  FileDao.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/17/21.
//

import Foundation
import FirebaseStorage
import Combine

protocol IStorageSource {
    func upload(file: Data, path: String) -> AnyPublisher<String, Error>
    func delete(path: String) -> AnyPublisher<Void, Error>
}

struct GoogleStorageSource: IStorageSource {
    private let storage: Storage
    init(storage: Storage = Storage.storage()) {
        self.storage = storage
    }
    
    func upload(file: Data, path: String) -> AnyPublisher<String, Error> {
        print("uploading file at path \(path)")
        var uploadTask: StorageUploadTask?
        return Future<String, Error> { promise in
            let ref = storage.reference(withPath: path)
            uploadTask = ref.putData(file, metadata: nil) { (metadata, error) in
                if error != nil {
                    return promise(.failure(error!))
                } else {
                    ref.downloadURL { url, error in
                        if error != nil {
                            return promise(.failure(error!))
                        } else {
                            return promise(.success(url!.absoluteString))
                        }
                    }
                }
            }
        }
        .handleEvents(receiveCancel: {
            if uploadTask != nil {
                print("")
                uploadTask!.cancel()
            }
        })
        .eraseToAnyPublisher()
    }
    
    func delete(path: String) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            let ref = storage.reference(withPath: path)
            ref.delete { error in
                if let error = error {
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
