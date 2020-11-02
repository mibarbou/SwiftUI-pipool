//
//  ExtensionsTests.swift
//  PipoolTests
//
//  Created by Michel Barbou Salvador on 01/11/2020.
//

import XCTest

class ExtensionsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_isValid_email_text() throws {
        XCTAssertTrue("user@email.com".isValidEmail)
        XCTAssertFalse("user2email.com".isValidEmail)
    }

}
