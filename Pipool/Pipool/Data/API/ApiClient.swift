//
//  ApiClient.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 18/09/2020.
//

import Foundation
import Moya

protocol ApiClient {
    
    var provider: MoyaProvider<PipoolApi> { get }
    
    func login(username: String,
               password: String,
               completion: @escaping (Result<LoginResponse, PipoolApiError>) -> Void)
}

class ApiClientDefault: ApiClient {
    
    var provider: MoyaProvider<PipoolApi> = MoyaProvider<PipoolApi>()
    
    private func request<T: Decodable>(_ endpoint: PipoolApi,
                                       completion: @escaping (Result<T, PipoolApiError>) -> Void) {
        provider.request(endpoint) { result in
            switch result {
            case .success(let response):
                do {
                    let data = !response.data.isEmpty ? response.data : "{}".data(using: .utf8)!
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(.parserError))
                }
            case .failure(let error):
                completion(.failure(.defaultError))
            }
            
        }
    }
    
    func login(username: String,
               password: String,
               completion: @escaping (Result<LoginResponse, PipoolApiError>) -> Void) {
        self.request(.login(username: username, password: password), completion: completion)
    }
    
}
