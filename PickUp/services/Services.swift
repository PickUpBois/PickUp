//
//  Services.swift
//  PickUp
//
//  Created by Arian Rahbar on 5/22/21.
//

import Foundation
import Apollo
import FirebaseStorage
import FirebaseAuth

class NetworkInterceptorProvider: LegacyInterceptorProvider {
    private let client: URLSessionClient
    private let auth: Auth
    
    init(store: ApolloStore, client: URLSessionClient, auth: Auth) {
        self.client = client
        self.auth = auth
        super.init(store: store)
    }
    
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthenticationInterceptor(auth: self.auth), at: 0)
        return interceptors
    }
}

class Services {
    
    static let PROD_URL = "\(Bundle.main.object(forInfoDictionaryKey: "PROD_HOST") as! String)"
    static let DEV_URL = "\(Bundle.main.object(forInfoDictionaryKey: "DEV_HOST") as! String)"
    
    static var emulator: Bool {
        let env = Bundle.main.object(forInfoDictionaryKey: "ENV") as! String
        if env == "DEV" {
            return true
        } else {
            return false
        }
    }
    
    static var auth: Auth = buildFirebaseAuth(emulator: emulator)
    
    static var storage: Storage = buildFirebaseStorage(emulator: emulator)
    
    static private func buildFirebaseAuth(emulator: Bool = false) -> Auth {
        let auth = Auth.auth()
        if emulator {
            auth.useEmulator(withHost: "localhost", port: 9099)
        }
        return auth
    }
    
    static private func buildFirebaseStorage(emulator: Bool = false) -> Storage {
        let storage = Storage.storage()
        if emulator {
            storage.useEmulator(withHost:"localhost", port:9199)
        }
        return storage
    }
    
    
    
    static let shared = Services()
    private(set) lazy var apollo: ApolloClient = {
        // The cache is necessary to set up the store, which we're going to hand to the provider
      let cache = InMemoryNormalizedCache()
      let store = ApolloStore(cache: cache)
      
      let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client, auth: Services.auth)
        let url =  URL(string: Services.emulator ? "\(Services.DEV_URL)/v1/graphql" : "\(Services.PROD_URL)/v1/graphql")!
        print(url)
      let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                               endpointURL: url)
                                                               

      // Remember to give the store you already created to the client so it
      // doesn't create one on its own
      return ApolloClient(networkTransport: requestChainTransport,
                          store: store)
    }()
    private(set) lazy var auth = AuthService(auth: Services.auth)
    private(set) lazy var client: GraphQLClient = {
        let url =  Services.emulator ? "\(Services.DEV_URL)/v1/graphql" : "\(Services.PROD_URL)/v1/graphql"
        return GraphQLClient(session: URLSession.shared, url: url)
    }()
    private(set) lazy var storage = StorageService(storage: Services.storage)
    private(set) lazy var rest = RestService()
}
