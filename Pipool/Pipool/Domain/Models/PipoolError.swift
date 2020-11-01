//
//  PipoolError.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 31/10/2020.
//

import Foundation

enum PipoolError: Error {
    case generic
    case custom(desc: String)
    case emailFormat
    case emptyString
}

extension PipoolError {
    var localizedDescription: String {
        switch self {
        case .generic:
            return "A default or unkonwn error"
        case .custom(desc: let desc):
            return desc
        case .emailFormat:
            return "Is not a valid email format"
        case .emptyString:
            return "This string should be filled"
        }
    }
}

