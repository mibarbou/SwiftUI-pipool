//
//  LoginResponse.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 19/09/2020.
//

import Foundation

struct LoginResponse: Decodable {
    let token: String
    let user: UserResponse
}

struct UserResponse: Decodable {
    let id: Int
    let name: String
    let surname: String
    let email: String
//    let createdAt: String
//    let updatedAt: String
}
