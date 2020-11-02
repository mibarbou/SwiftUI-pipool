//
//  UserPreferences.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import Foundation

protocol UserPreferences {
    var isUserLoggedIn: Bool { get }
    func saveUser(email: String)
    func getUserEmail() -> String?
}

struct UserPeferencesDefault: UserPreferences {
    private static let emailKey = "UserEmailKey"
    
// TODO: - Use suite group instead when is stablished
    private let userDefaults: UserDefaults = UserDefaults.standard//UserDefaults(suiteName: Configuration.suiteGroup)!
    var isUserLoggedIn = false
    
    func saveUser(email: String) {
        userDefaults.set(email, forKey: UserPeferencesDefault.emailKey)
        userDefaults.synchronize()
    }
    
    func getUserEmail() -> String? {
        return userDefaults.string(forKey: UserPeferencesDefault.emailKey)
    }
}
