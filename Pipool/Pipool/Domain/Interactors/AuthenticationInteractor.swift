//
//  LoginInteractor.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import Foundation

protocol AuthenticationInteractor {
    func loginWith(email: String, password: String, completion: @escaping (Result<Void, PipoolError>) -> Void)
    func registerWith(name: String, surname: String, email: String, password: String, completion: @escaping (Result<Void, PipoolError>) -> Void)
}

struct AuthenticationInteractorDefault: AuthenticationInteractor {
    
    var apiClient: ApiClient = ApiClientDefault()
    var keychainRepository: KeychainRepository = KeychainRepositoryDefault()
  
    func loginWith(email: String, password: String, completion: @escaping (Result<Void, PipoolError>) -> Void) {
        
        apiClient.login(email: email,
                        password: password) { result in
            switch result {
            case .success(let response):
                save(token: response.token, email: email)
                completion(.success(()))
            case .failure(let error):
                print(error)
                completion(.failure(.generic))
            }
        }
    }
    
    func registerWith(name: String,
                      surname: String,
                      email: String,
                      password: String,
                      completion: @escaping (Result<Void, PipoolError>) -> Void) {
        apiClient.signUp(name: name,
                         surname: surname,
                         email: email,
                         password: password) { result in
            switch result {
            case .success(let response):
                save(token: response.token, email: email)
                completion(.success(()))
            case .failure(let error):
                print(error)
                completion(.failure(.generic))
            }
        }
    }
}

extension AuthenticationInteractorDefault {
    private func save(token: String, email: String) {
        keychainRepository.saveUser(token: token, with: email)
    }
}
