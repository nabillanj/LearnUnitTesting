//
//  SignupFormModelValidator.swift
//  LearnUnitTesting
//
//  Created by nabilla on 16/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import UIKit

class SignupFormModelValidator: NSObject {


    //TODO: Learn REGEX validation

    func isValidName(name: String) -> Bool {
        var returnValue = true

        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            returnValue = false
        }

        if name.count < SignupConstant.validNameMinimumLength || name.count > SignupConstant.validNameMaximumLength {
            returnValue = false
        }

        return returnValue
    }

    func isValidEmail(email: String) -> Bool {
        var returnValue = true

        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            returnValue = false
        }

        if email.count < SignupConstant.validEmailMinimumLength || email.count > SignupConstant.validEmailMaximumLength {
            returnValue = false
        }

        if !email.contains(".") || !email.contains("@"){
            returnValue = false
        }

        return returnValue
    }

    func isValidPassword(password: String) -> Bool {
        var returnValue = true
        if password.count < SignupConstant.validPasswordMinimumLength || password.count > SignupConstant.validPasswordMaximumLength {
            returnValue = false
        }

        return returnValue
    }

    func checkPasswordMatch(password: String, repeatPassword: String) -> Bool {
        if password == repeatPassword {
            return true
        }
        return false
    }
}
