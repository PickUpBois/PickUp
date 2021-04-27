//
//  FileRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 4/18/21.
//

import Foundation
import Combine

struct FileRepo: IFileRepo {
    let storageSource: IStorageSource
    let urlSource: IUrlSource
    
    init(storageSource: IStorageSource = GoogleStorageSource(),
         urlSource: IUrlSource = SharedUrlDownloadSource()) {
        self.storageSource = storageSource
        self.urlSource = urlSource
    }
    
    func upload(file: Data, path: String) -> AnyPublisher<String, Error> {
        return storageSource.upload(file: file, path: path)
    }
    
    func download(url: URL) -> AnyPublisher<Data, Error> {
        return urlSource.download(remoteUrl: url)
    }
    
    func delete(path: String) -> AnyPublisher<Void, Error> {
        return storageSource.delete(path: path)
    }
}
