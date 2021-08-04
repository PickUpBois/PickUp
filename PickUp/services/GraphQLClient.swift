//
//  GraphQL.swift
//  PickUp
//
//  Created by Arian Rahbar on 8/2/21.
//

import Foundation

enum GraphQLError {
    case error
}

struct GraphQLPostBody<T: Encodable>: Encodable {
    var query: String
    var variables: T
}

struct GraphQLErrorMessage: Decodable {
    var message: String
}

struct GraphQLResponse<T: Decodable>: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case data, errors
    }
    var data: T?
    var errors: [GraphQLErrorMessage]?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try values.decodeIfPresent(T.self, forKey: .data)
        self.errors = try values.decodeIfPresent([GraphQLErrorMessage].self, forKey: .errors)
    }
}

class GraphQLClient {
    let session: URLSession
    let url: URL
    init(session: URLSession, url: String) {
        self.session = session
        self.url = URL(string: url)!
    }
    
    func post<T: Encodable, W: Decodable>(query: String, variables: T, completion: @escaping (W?, GraphQLError?) -> Void) {
        var request = URLRequest(url: self.url)
        request.addValue(AppState.shared.authId ?? "", forHTTPHeaderField: "X-Hasura-User-Id")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postBody = GraphQLPostBody<T>(query: query, variables: variables)
        let data = try! JSONEncoder().encode(postBody)
        request.httpBody = data
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return completion(nil, GraphQLError.error)
            }
            guard let data = data else {
                return completion(nil, GraphQLError.error)
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            guard let responseBody = try? JSONDecoder().decode(GraphQLResponse<W>.self, from: data) else {
                return completion(nil, GraphQLError.error)
            }
            if let errors = responseBody.errors {
                print(errors[0])
                return completion(nil, GraphQLError.error)
            }
            return completion(responseBody.data, nil)
        }
    }
}
