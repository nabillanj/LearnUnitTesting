//
//  LearnUnitTestingTests.swift
//  LearnUnitTestingTests
//
//  Created by nabilla on 15/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import XCTest
@testable import LearnUnitTesting

class LearnUnitTestingTests: XCTestCase {

    // REQUIREMENT:
    // Naming: func test<System Under Test>_<Conditiion or State Change>_<Expected Result>()
    // Ex: func testSignUpModel_WhenInformationProvided_PasswordShouldMatchRepeatPassword()
    // will help to know the function of test class with only see the name of function:)

    // This code only called one
    // ex: you can create instance of your class in here
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    // To remove created instance, this is will help the code to removed after we're done to testing it
    // will make app faster too
    // running after all test case already executed.
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // example of testing class
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    // to testing perfomance of test case class
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
