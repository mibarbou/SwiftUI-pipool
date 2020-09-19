//
//  PipoolApi.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import Foundation
import Moya

enum PipoolApi {
    case login(username: String, password: String)
}

extension PipoolApi: TargetType, AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .login:
            return .basic
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
        case .login:
            return commonHeaders
        }
    }
}

extension PipoolApi {
    var method: Moya.Method {
        switch self {
        case .login:
            return .get
        }
    }
}

extension PipoolApi {
    var path: String {
        switch self {
        case .login:
            return ""
        }
    }
}

extension PipoolApi {
    var task: Task {
        switch self {
        case .login:
            return .requestPlain
        }
    }
}

extension PipoolApi {
    var sampleData: Data {
        switch self {
        case .login:
            return sampleData(filename: "login")
        }
    }
    
    private func sampleData(filename: String) -> Data {
        //swiftlint:disable force_try
        return try! Data(contentsOf: Bundle.main.url(forResource: filename, withExtension: "json")!)
    }
}
