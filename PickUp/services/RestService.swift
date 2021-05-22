//
//  RestService.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Combine

class RestService {
    func download(remoteUrl: URL) -> AnyPublisher<Data, Error> {
        print("downloading from remote url at \(remoteUrl.absoluteString)")
        return Future<Data, Error> { promise in
            let session = URLSession.shared.downloadTask(with: remoteUrl, completionHandler: {tempLocalUrl, response, error in
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    print("downloaded image with temporary url at \(tempLocalUrl.absoluteString)")
                    do {
                        let data = try Data(contentsOf: tempLocalUrl)
                        return promise(.success(data))
                    } catch(let error) {
                        return promise(.failure(error))
                    }
                } else {
                    print("Error downloading image from url with error: \(error!.localizedDescription)")
                    return promise(.failure(error!))
                }
            })
            session.resume()
        }.eraseToAnyPublisher()
    }
}
