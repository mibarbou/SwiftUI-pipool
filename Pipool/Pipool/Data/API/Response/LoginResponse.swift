//
//  LoginRespnse.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import Foundation

struct LoginResponse: Decodable {
    let userToken: String
    let userId: Int
    let error: Bool
    let status: Int?
    let code: Int?
    
    private enum CodingKeys: String, CodingKey {
        case userToken = "jwt"
        case userId = "user_id"
        case error
        case status
        case code
    }
}
