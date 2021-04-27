//
//  UserRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/18/21.
//

import Foundation
import Combine
import Firebase

enum UserError: Error {
    case error
}

struct UserRepo: IUserRepo {
    let db: Firestore
    let collectionRef: CollectionReference
    
    init(db: Firestore = Firestore.firestore()) {
        self.db = db
        self.collectionRef = db.collection("users")
    }
    
    func create(item: User) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            let _ = collectionRef.document(item.id!).setData(DataUser(user: item).getDictionary()!, completion: {error in
                if let error = error {
                    return promise(.failure(error))
                } else {
                    return promise(.success(()))
                }
            })
        }.eraseToAnyPublisher()
    }
    
    func get(id: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            collectionRef.document(id).getDocument { document, error in
                let result = Result {
                    try document?.data(as: DataUser.self)
                }
                switch result {
                case .success(var user):
                    if var user = user {
                        user.id = id
                        return promise(.success(user.toUser()))
                    } else {
                        return promise(.failure(UserError.error))
                    }
                    return promise(.success(user!.toUser()))
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func update(id: String, fields: [ AnyHashable : Any ]) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            let ref = collectionRef.document(id)
            ref.updateData(fields) { error in
                if let error = error {
                    return promise(.failure(error))
                } else {
                    return promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func delete(id: String) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            
        }.eraseToAnyPublisher()
    }
    
    func observe(id: String) -> AnyPublisher<User, Error> {
        var handle: ListenerRegistration!
        
    }
}
