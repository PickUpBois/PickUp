//
//  UserRestRepo.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/13/21.
//

import Foundation
import Combine

class UserRepo: IUserRepo {
    func create(item: User) -> AnyPublisher<Void, Error> {
        let url = URL(string: RepoFactory.TARGET_URL + "users/\(item.id!)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var dataUser = DataUser(user: item)
        dataUser.id = nil
        guard let postData = try? JSONEncoder().encode(dataUser) else {
            return Fail(error: UserError.error).eraseToAnyPublisher()
        }
        print(postData)
        urlRequest.httpBody = postData
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { element -> Void in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func get(id: String) -> AnyPublisher<User, Error> {
        let url = URL(string: RepoFactory.TARGET_URL + "users/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: DataUser.self, decoder: JSONDecoder())
            .map { dataUser -> User in
                print(dataUser)
                let user = dataUser.toUser()
                return user
            }
            .eraseToAnyPublisher()
    }
    
    func update(id: String, fields: [String : Any]) -> AnyPublisher<Void, Error> {
        let url = URL(string: RepoFactory.TARGET_URL + "users/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PATCH"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let patchData = try? JSONSerialization.data(withJSONObject: fields, options: []) else {
            print("failed to encode json data")
            return Fail(error: UserError.error).eraseToAnyPublisher()
        }
        urlRequest.httpBody = patchData
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { element -> Void in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func delete(id: String) -> AnyPublisher<Void, Error> {
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    func observe(id: String) -> AnyPublisher<User, Error> {
        return Just(User(id: "hello", username: "hello", firstName: "hello", lastName: "hello", photoUrl: "hello")).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

class UserApolloRepo: IUserRepo {
    func create(item: User) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            let input = CreateUserInput(id: item.id!, username: item.username, firstName: item.firstName, lastName: item.lastName)
            Network.shared.apollo.perform(mutation: CreateUserMutation(createUserInput: input)) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0])
                        return promise(.failure(UserError.error))
                    }
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func get(id: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            Network.shared.apollo.fetch(query: GetUserQuery(id: id), cachePolicy: .fetchIgnoringCacheCompletely) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0])
                        return promise(.failure(errors[0]))
                    }
                    guard let data = result.data else {
                        return promise(.failure(UserError.error))
                    }
                    
                    var user: User = User(id: data.user.id, username: data.user.username, firstName: data.user.firstName, lastName: data.user.lastName, photoUrl: data.user.photoUrl)
                    return promise(.success(user))
                    
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func update(id: String, fields: [String : Any]) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            let input = UpdateUserInput(id: id, firstName: fields["firstName"] as! String? , lastName: fields["lastName"] as! String?, username: fields["username"] as! String? , photoUrl: fields["photoUrl"] as! String? )
            
            Network.shared.apollo.perform(mutation: UpdateUserMutation(input: input)) { response in
                switch response {
                case .success(let result):
                    if let errors = result.errors {
                        print(errors[0].localizedDescription)
                        return promise(.failure(errors[0]))
                    }
                    return promise(.success(()))
                case .failure(let error):
                    print(error.localizedDescription)
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func delete(id: String) -> AnyPublisher<Void, Error> {
        return Fail(error: UserError.error).eraseToAnyPublisher()
    }
    
    func observe(id: String) -> AnyPublisher<User, Error> {
        return Fail(error: UserError.error).eraseToAnyPublisher()
    }
    
    
}
