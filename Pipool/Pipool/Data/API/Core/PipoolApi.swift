//
//  PipoolApi.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import Foundation
import Moya

enum PipoolApi {
    case login(_ data: LoginRequest)
    case signUp(_ data: SignUpRequest)
    case services
    case createService(_ data: CreateServiceRequest)
    case getService(id: Int)
    case updateService(id: Int, data: CreateServiceRequest)
    case deleteService(id: Int)
    case categories
    case products(serviceId: Int)
    case createProduct(serviceId: Int, data: CreateProductRequest)
    case updateProduct(serviceId: Int, id: Int, data: CreateProductRequest)
    case deleteProduct(serviceId: Int, id: Int)
}

extension PipoolApi: TargetType, AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .login, .signUp:
            return .none
        default:
            return .bearer
        }
    }
    
    var baseURL: URL {
        return URL(string: "\(Configuration.serverURLString)/api")!
    }
    
    var headers: [String: String]? {
        let commonHeaders: [String: String] = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        switch self {
        case .login, .signUp:
            return commonHeaders
        default:
            return commonHeaders
        }
    }
}

extension PipoolApi {
    var method: Moya.Method {
        switch self {
        case .login, .signUp, .createService, .createProduct:
            return .post
        case .services, .categories, .getService, .products:
            return .get
        case .updateService, .updateProduct:
            return .put
        case .deleteService, .deleteProduct:
            return .delete
        }
    }
}

extension PipoolApi {
    var path: String {
        switch self {
        case .login:
            return "/users/login"
        case .signUp:
            return "/users/sign-up"
        case .services, .createService:
            return "/services"
        case .getService(id: let id):
            return "/services/\(id)"
        case .updateService(id: let id):
            return "/services/\(id)"
        case .deleteService(id: let id):
            return "/services/\(id)"
        case .categories:
            return "/categories"
        case .products(serviceId: let id):
            return "/services/\(id)/products"
        case .createProduct(serviceId: let id):
            return "/services/\(id)/products"
        case .updateProduct(serviceId: let sId, id: let id, data: _):
            return "/services/\(sId)/products/\(id)"
        case .deleteProduct(serviceId: let sId, id: let id):
            return "/services/\(sId)/products/\(id)"
        }
    }
}

extension PipoolApi {
    var task: Task {
        switch self {
        case .login(let data):
            return .requestJSONEncodable(data)
        case .signUp(let data):
            return .requestJSONEncodable(data)
        case .createService(let data):
            return .requestJSONEncodable(data)
        case .updateService(id: _, data: let data):
            return .requestJSONEncodable(data)
        case .createProduct(serviceId: _, data: let data):
            return .requestJSONEncodable(data)
        case .updateProduct(serviceId: _, id: _, data: let data):
            return .requestJSONEncodable(data)
        case .services, .getService, .categories, .deleteService, .products, .deleteProduct:
            return .requestPlain
        }
    }
}

extension PipoolApi {
    var sampleData: Data {
        switch self {
        case .login:
            return sampleData(filename: "login")
        case .signUp:
            return sampleData(filename: "signUp")
        case .services:
            return sampleData(filename: "services")
        case .categories:
            return sampleData(filename: "categories")
        default:
            return Data()
        }
    }
    
    private func sampleData(filename: String) -> Data {
        //swiftlint:disable force_try
        return try! Data(contentsOf: Bundle.main.url(forResource: filename, withExtension: "json")!)
    }
}
