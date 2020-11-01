//
//  String+isFilled.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import Foundation

extension String {
    
    var isFilled: Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        return !trimmedString.isEmpty
    }
}
