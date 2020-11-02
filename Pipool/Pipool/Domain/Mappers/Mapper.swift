//
//  Mapper.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import Foundation

protocol Mapper {
    associatedtype Input
    associatedtype Output
    static func map(input: Input) -> Output
}
