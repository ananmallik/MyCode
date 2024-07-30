//
//  TestingTests.swift
//  TestingTests
//
//  Created by A. Mallik on 16/07/2024.
//

import XCTest
@testable import Testing

class TestingTests: XCTestCase {

    func test_assertTrue() {
        let success = true
        XCTAssertTrue(success)
    }
    
    func test_assertNil() {
    let optionalValue: Int? = nil
        XCTAssertNil(optionalValue)
    }

}
