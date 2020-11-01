//
//  String+email.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@",
                                         "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        return emailPredicate.evaluate(with: self)
    }
}
