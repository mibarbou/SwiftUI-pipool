//
//  KeychainRepository.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 29/10/2020.
//

import Foundation

protocol KeychainRepository {
    func saveUser(token: String, with email: String)
    func getUserToken(with email: String) -> String?
    func deleteToken(with email: String)
}

struct KeychainRepositoryDefault: KeychainRepository {
    func saveUser(token: String, with email: String) {
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: email,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.savePassword(token)
          } catch { print(error.localizedDescription) }
    }
    
    func getUserToken(with email: String) -> String? {
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: email,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            let token = try passwordItem.readPassword()
            return token
        } catch { print(error.localizedDescription) }
        return nil
    }
    
    func deleteToken(with email: String) {
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: email,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.deleteItem()
            
        } catch { print(error.localizedDescription) }
    }
}
