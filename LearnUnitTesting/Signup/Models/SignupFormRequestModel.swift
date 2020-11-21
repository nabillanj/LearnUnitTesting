//
//  SignupFormRequestModel.swift
//  LearnUnitTesting
//
//  Created by nabilla on 21/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}
