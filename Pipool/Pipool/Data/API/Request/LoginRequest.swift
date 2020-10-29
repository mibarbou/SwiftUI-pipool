//
//  LoginRequest.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 28/10/2020.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
