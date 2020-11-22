//
//  MockSignupWebService.swift
//  LearnUnitTestingTests
//
//  Created by nabilla on 22/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation
@testable import LearnUnitTesting

class MockSignupWebService: SignupWebServiceProtocol {

    var isSignupMethodCalled: Bool = false

    override func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true

        let reponseModel = SignupResponseModel(status: "ok")
        completionHandler(reponseModel, nil)
    }
}
