//
//  SignupViewDelegateProtocol.swift
//  LearnUnitTesting
//
//  Created by nabilla on 22/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
