//
//  ServiceResponse.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 14/11/2020.
//

import Foundation

struct ServiceResponse: Decodable {
    let id: Int
    let name: String
    let categoryId: Int
    let createdAt: String
    let updatedAt: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, categoryId
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
