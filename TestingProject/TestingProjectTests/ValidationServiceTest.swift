//
//  ValidationServiceTest.swift
//  TestingProjectTests
//
//  Created by 심지원 on 2020/08/07.
//  Copyright © 2020 심지원. All rights reserved.
//
@testable import TestingProject
import XCTest

class ValidationServiceTest: XCTestCase {
    
    var validation: ValidationService!

    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    func test_is_valid_username() {
        XCTAssertNoThrow(try validation.validationUsername("johnny"))
    }
    
    func test_username_is_nil() {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validationUsername(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        
//        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_username_too_short() {
        let expectedError = ValidationError.usernameTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validationUsername("jn")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_username_too_long() {
        let expectedError = ValidationError.usernameTooLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validationUsername("johnny youre the goat!")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
}
