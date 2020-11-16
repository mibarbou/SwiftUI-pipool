//
//  CreateServiceRequest.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 16/11/2020.
//

import Foundation

struct CreateServiceRequest: Encodable {
    let name: String
    let categoryId: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case categoryId = "category_id"
    }
}
