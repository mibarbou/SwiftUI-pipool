//
//  SignUpRequest.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 28/10/2020.
//

import Foundation

struct SignUpRequest: Encodable {
    let name: String
    let surname: String
    let email: String
    let password: String
}
