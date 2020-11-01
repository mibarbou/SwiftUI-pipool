//
//  ApiClient.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 18/09/2020.
//

import Foundation
import Moya

protocol ApiClient {
        
    func login(email: String,
               password: String,
               completion: @escaping (Result<LoginResponse, PipoolApiError>) -> Void)
    
    func signUp(name: String,
                surname: String,
                email: String,
                password: String,
                completion: @escaping (Result<LoginResponse, PipoolApiError>) -> Void)
    
}

class ApiClientDefault: ApiClient {
    
    var provider: MoyaProvider<PipoolApi> {
        return MoyaProvider<PipoolApi>(plugins: [
            NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)),
            AccessTokenPlugin { _ in KeychainRepositoryDefault().getUserToken(with: "") ?? "" }
            ]
        )
    }
    
    func login(email: String,
               password: String,
               completion: @escaping (Result<LoginResponse, PipoolApiError>) -> Void) {
        let data = LoginRequest(email: email,
                                password: password)
        self.request(.login(data), completion: completion)
    }
    
    func signUp(name: String,
                surname: String,
                email: String,
                password: String,
                completion: @escaping (Result<LoginResponse, PipoolApiError>) -> Void) {
        let data = SignUpRequest(name: name,
                                    surname: surname,
                                    email: email,
                                    password: password)
        self.request(.signUp(data), completion: completion)
    }
    
}

// MARK: - Private methods
extension ApiClientDefault {
    
    private func request<T: Decodable>(_ endpoint: PipoolApi,
                                       completion: @escaping (Result<T, PipoolApiError>) -> Void) {
        
        provider.request(endpoint) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try JSONDecoder().decode(ApiResponse<T>.self, from: response.data)
                    completion(.success(decodedResponse.data))
                } catch {
                    completion(.failure(.parser))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(.generic))
            }
            
        }
    }
    
}
