//
//  ApiResponse.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 25/10/2020.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    var data: T
}
