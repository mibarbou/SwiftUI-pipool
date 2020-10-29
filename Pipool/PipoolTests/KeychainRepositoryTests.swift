//
//  RepositoriesTests.swift
//  PipoolTests
//
//  Created by Michel Barbou Salvador on 29/10/2020.
//

import XCTest

class KeychainRepositoryTests: XCTestCase {
    
    var keychainRepository: KeychainRepository!

    override func setUpWithError() throws {
        keychainRepository = KeychainRepositoryDefault()
    }

    override func tearDownWithError() throws {
        keychainRepository = nil
    
    }

    func test_get_user_token_in_keychain() throws {
        let token = "someRandomToken"
        let email = "test@email.com"
        
        keychainRepository.saveUser(token: token, with: email)
        let tokenObtained = keychainRepository.getUserToken(with: email)!
        XCTAssertEqual(tokenObtained, token)
        
        keychainRepository.deleteToken(with: email)
        XCTAssertNil(keychainRepository.getUserToken(with: email))
    }
}
