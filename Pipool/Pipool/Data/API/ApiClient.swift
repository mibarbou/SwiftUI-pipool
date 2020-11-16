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
    
    func services(completion: @escaping (Result<[ServiceResponse], PipoolApiError>) -> Void)
    func createService(name: String, categoryId: Int, completion: @escaping (Result<[ServiceResponse], PipoolApiError>) -> Void)
    func getService(id: Int, completion: @escaping (Result<ServiceResponse, PipoolApiError>) -> Void)
    func updateService(id: Int, name: String, categoryId: Int, completion: @escaping (Result<ServiceResponse, PipoolApiError>) -> Void)
    func deleteService(id: Int, completion: @escaping (Result<Void, PipoolApiError>) -> Void)
    
    func categories(completion: @escaping (Result<[CategoryResponse], PipoolApiError>) -> Void)
    
}

class ApiClientDefault: ApiClient {
    
    var provider: MoyaProvider<PipoolApi> {
        let userPreferences = UserPeferencesDefault()
        return MoyaProvider<PipoolApi>(plugins: [
            NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)),
            AccessTokenPlugin { _ in userPreferences.getCurrentCredentials()?.token ?? "" }
            ]
        )
    }
    
    // MARK: - Authentication
    
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
    
    // MARK: - Services
    
    func services(completion: @escaping (Result<[ServiceResponse], PipoolApiError>) -> Void) {
        self.request(.services, completion: completion)
    }
    
    func createService(name: String, categoryId: Int, completion: @escaping (Result<[ServiceResponse], PipoolApiError>) -> Void) {
        let data = CreateServiceRequest(name: name,
                                        categoryId: categoryId)
        self.request(.createService(data), completion: completion)
    }
    
    func getService(id: Int, completion: @escaping (Result<ServiceResponse, PipoolApiError>) -> Void) {
        self.request(.getService(id: id), completion: completion)
    }
    
    func updateService(id: Int, name: String, categoryId: Int, completion: @escaping (Result<ServiceResponse, PipoolApiError>) -> Void) {
        let data = CreateServiceRequest(name: name,
                                        categoryId: categoryId)
        self.request(.updateService(id: id, data: data), completion: completion)
    }
    
    func deleteService(id: Int, completion: @escaping (Result<Void, PipoolApiError>) -> Void) {
        self.request(.deleteService(id: id), completion: completion)
    }

    // MARK: - Categories
    
    func categories(completion: @escaping (Result<[CategoryResponse], PipoolApiError>) -> Void) {
        self.request(.categories, completion: completion)
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
    
    private func request<T: Decodable>(_ endpoint: PipoolApi, completion: @escaping (Result<[T], PipoolApiError>) -> Void) {
        provider.request(endpoint) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try JSONDecoder().decode(ApiResponse<[T]>.self, from: response.data)
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
    
    private func request(_ endpoint: PipoolApi,
                         completion: @escaping (Result<Void, PipoolApiError>) -> Void) {
        
        provider.request(endpoint) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(.generic))
            }
            
        }
    }
    
}
