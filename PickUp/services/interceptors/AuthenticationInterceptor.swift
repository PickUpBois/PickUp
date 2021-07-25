//
//  AuthenticationInterceptor.swift
//  PickUp
//
//  Created by Arian Rahbar on 6/15/21.
//

import Foundation
import FirebaseAuth
import Apollo

class AuthenticationInterceptor: ApolloInterceptor {
    
    private let auth: Auth
    
    init(auth: Auth) {
        self.auth = auth
    }
    private func addTokenAndProceed<Operation: GraphQLOperation>(
            _ token: String,
            to request: HTTPRequest<Operation>,
            chain: RequestChain,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            request.addHeader(name: "X-Hasura-Role", value: "admin")
            request.addHeader(name: "X-Hasura-User-Id", value: token)
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }
    
    
    func interceptAsync<Operation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
        auth.currentUser?.getIDToken(completion: {token, error in
            if error != nil {
                print(error!.localizedDescription)
                chain.handleErrorAsync(error!,
                                       request: request,
                                       response: response,
                                       completion: completion)
                return
            }
            guard let token = token else {
                chain.handleErrorAsync(AuthError.error,
                                       request: request,
                                       response: response,
                                       completion: completion)
                return
            }
            self.addTokenAndProceed(token, to: request, chain: chain, response: response, completion: completion)
        })
    }
}
