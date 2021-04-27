//
//  UpdateProfilePictureFromExternalUrl.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/18/21.
//

import Foundation
import Combine

protocol IUpdateProfilePictureFromExternalUrl {
    func execute(url: String, userId: String) -> AnyPublisher<String, Error>
}

enum ProfilePicErrors: Error {
    case error
}

struct UpdateProfilePictureFromExternalUrl: IUpdateProfilePictureFromExternalUrl {
    
    let fileRepo: IFileRepo
    let userRepo: IUserRepo
    
    init(fileRepo: IFileRepo = FileRepo(),
         userRepo: IUserRepo = UserRepo()) {
        self.fileRepo = fileRepo
        self.userRepo = userRepo
    }
    
    func execute(url: String, userId: String) -> AnyPublisher<String, Error> {
        print("uploading url: \(url)")
        guard let remoteUrl = URL(string: url) else {
            return Fail<String, Error>(error: ProfilePicErrors.error)
                .eraseToAnyPublisher()
        }
        let path = "profilePictures/\(userId).jpg"
        print("using path \(path)")
        return fileRepo.download(url: remoteUrl)
            .flatMap { data in
                fileRepo.upload(file: data, path: path)
            }
            .flatMap({ downloadUrl -> AnyPublisher<String, Error> in
                print("downloadUrl: \(downloadUrl)")
                return userRepo.update(id: userId, fields: ["photoUrl" : downloadUrl])
                    .flatMap { _ in
                        Just(downloadUrl)
                    }.eraseToAnyPublisher()
            }).eraseToAnyPublisher()
        
    }
}
