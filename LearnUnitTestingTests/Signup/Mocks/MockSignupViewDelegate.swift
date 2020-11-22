//
//  MockSignupViewDelegate.swift
//  LearnUnitTestingTests
//
//  Created by nabilla on 22/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation
import XCTest
@testable import LearnUnitTesting

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?

    func successfullSignup() {
        expectation?.fulfill()
    }

    func errorHandler(error: SignupError) {

    }

}
