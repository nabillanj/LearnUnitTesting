//
//  MockSignupModelValidator.swift
//  LearnUnitTestingTests
//
//  Created by nabilla on 22/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation
@testable import LearnUnitTesting

class MockSignupModelValidator: SignupModelValidatorProtocol {

    var isFirstNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isPasswordMatch: Bool = false


    func isValidName(name: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }

    func isValidEmail(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }

    func isValidPassword(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }

    func checkPasswordMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordMatch = true
        return isPasswordMatch
    }
}
