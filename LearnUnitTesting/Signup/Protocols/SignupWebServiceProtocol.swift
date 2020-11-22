//
//  SignupWebServiceProtocol.swift
//  LearnUnitTesting
//
//  Created by nabilla on 22/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation

class SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {}
}
