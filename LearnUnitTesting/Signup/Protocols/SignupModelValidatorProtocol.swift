//
//  SignupModelValidatorProtocol.swift
//  LearnUnitTesting
//
//  Created by nabilla on 22/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isValidName(name: String) -> Bool
    func isValidEmail(email: String) -> Bool
    func isValidPassword(password: String) -> Bool
    func checkPasswordMatch(password: String, repeatPassword: String) -> Bool
}
