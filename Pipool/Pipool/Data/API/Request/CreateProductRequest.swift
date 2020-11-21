//
//  CreateProductRequest.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 21/11/2020.
//

import Foundation

struct CreateProductRequest: Encodable {
    let name: String
    let description: String
    let price: Int
}
