//
//  Mapper.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import Foundation

protocol Mapper {
    associatedtype IN
    associatedtype OUT
    static func map(input: IN) -> OUT
}
