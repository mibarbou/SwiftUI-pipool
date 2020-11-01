//
//  LoginInteractor.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import Foundation

protocol LoginInteractor {
    func loginWith(email: String, password: String, completion: @escaping (Result<Void, PipoolError>) -> Void)
}

struct LoginInteractorDefault: LoginInteractor {
    
    var apiClient: ApiClient = ApiClientDefault()
  
    func loginWith(email: String, password: String, completion: @escaping (Result<Void, PipoolError>) -> Void) {
        
        apiClient.login(email: email,
                        password: password) { result in
            switch result {
            case .success(let response):
                save(token: response.token)
                completion(.success(()))
            case .failure(let error):
                print(error)
                completion(.failure(.generic))
            }
        }
    }
}

extension LoginInteractorDefault {
    
    private func save(token: String) {
        
    }
}
