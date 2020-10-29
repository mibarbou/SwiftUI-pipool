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
}

extension PipoolApi: TargetType, AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .login, .signUp:
            return .bearer
        }
    }
    
    var environmentBaseURL: String {
        return ""
    }
    
    var baseURL: URL {
        return URL(string: environmentBaseURL)!
    }
    
    var headers: [String: String]? {
        let commonHeaders: [String: String] = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        switch self {
        case .login, .signUp:
            return commonHeaders
        }
    }
}

extension PipoolApi {
    var method: Moya.Method {
        switch self {
        case .login, .signUp:
            return .post
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
        }
    }
    
    private func sampleData(filename: String) -> Data {
        //swiftlint:disable force_try
        return try! Data(contentsOf: Bundle.main.url(forResource: filename, withExtension: "json")!)
    }
}
