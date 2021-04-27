//
//  IUpdateProfilePicByImage.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/27/21.
//

import Foundation
import Combine

protocol IUpdateProfilePicByImage {
    func execute(image: Data, userId: String) -> AnyPublisher<String, Error>
}

struct UpdateProfilePicByImage: IUpdateProfilePicByImage {
    let fileRepo: IFileRepo
    let userRepo: IUserRepo
    
    init(fileRepo: IFileRepo = FileRepo(),
         userRepo: IUserRepo = UserRepo()) {
        self.fileRepo = fileRepo
        self.userRepo = userRepo
    }
    
    func execute(image: Data, userId: String) -> AnyPublisher<String, Error> {
        let path = "profilePictures/\(userId).jpg"
        return fileRepo.upload(file: image, path: path)
            .flatMap({ downloadUrl -> AnyPublisher<String, Error> in
                print("downloadUrl: \(downloadUrl)")
                return userRepo.update(id: userId, fields: ["photoUrl" : downloadUrl])
                    .flatMap { _ in
                        Just(downloadUrl)
                    }.eraseToAnyPublisher()
            }).eraseToAnyPublisher()
    }
    
    
}
