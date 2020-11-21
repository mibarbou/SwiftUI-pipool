//
//  ProductResponse.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 21/11/2020.
//

import Foundation

struct ProductResponse: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Int
    let createdAt: Double
    let updatedAt: Double
    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, price
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
