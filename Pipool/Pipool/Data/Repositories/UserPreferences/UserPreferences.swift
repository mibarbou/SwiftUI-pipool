//
//  UserPreferences.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import Foundation

protocol UserPreferences {
    var isUserLoggedIn: Bool { get }
    func saveCredentials(credentials: Credentials)
    func getCurrentCredentials() -> Credentials?
}

struct UserPeferencesDefault: UserPreferences {
    private static let emailKey = "UserEmailKey"
    
// TODO: - Use suite group instead when is stablished
    private let userDefaults: UserDefaults = UserDefaults.standard//UserDefaults(suiteName: Configuration.suiteGroup)!
    private let keychainRepository: KeychainRepository = KeychainRepositoryDefault()
    
    var isUserLoggedIn: Bool {
        return getCurrentCredentials() != nil
    }
    
    func saveCredentials(credentials: Credentials) {
        userDefaults.set(credentials.email,
                         forKey: UserPeferencesDefault.emailKey)
        userDefaults.synchronize()
        keychainRepository.saveUser(token: credentials.token,
                                    with: credentials.email)
    }
    
    func getCurrentCredentials() -> Credentials? {
        guard let email = userDefaults.string(forKey: UserPeferencesDefault.emailKey),
              let token = keychainRepository.getUserToken(with: email) else {
                return nil
        }
        return Credentials(email: email,
                           token: token)
    }
}
