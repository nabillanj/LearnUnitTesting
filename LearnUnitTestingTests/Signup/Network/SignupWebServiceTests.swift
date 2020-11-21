//
//  SignupWebServiceTests.swift
//  LearnUnitTestingTests
//
//  Created by nabilla on 21/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import XCTest
@testable import LearnUnitTesting

class SignupWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!

    override func setUp() {
        // initialize url session
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstant.signupURLString, urlSession: urlSession)
        signFormRequestModel = SignupFormRequestModel(firstName: "Nabilla", lastName: "Nurjanah", email: "nabillanurjannah@Gmail.com", password: "nabilla123")
    }

    override func tearDown() {
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testSignupWebService_WhenReceiveSuccessfullResponse_ReturnSuccess() {
        // create mock response
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSignUpWebService_WhenReceiveDifferentJSONResponse_ErrorTookPlace() {
        // create mock response
        let jsonString = "{\"path\":\"users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        // start testing
        let expectation = self.expectation(description: "Signup Web Service Response Expectation different JSON Structure")

        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            XCTAssertNil(signupResponseModel, "The response model for unknowing JSON should be nill")
            XCTAssertEqual(error, SignupError.invalidResponseModel)
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSignUpWebService_WhenEmptyUrlStringProvided_ReturnError() {
        sut = SignupWebService(urlString: "")
        let expectation = self.expectation(description: "Empty Request URL string expectation")

        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            XCTAssertNil(signupResponseModel, "The response model for unknowing JSON should be nill")
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "Signup() not returned an expected error")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenURLRequestFails_ReturnErrorMessageDescription() {
        let expectation = self.expectation(description: "Failed request expectations")
        MockURLProtocol.error = SignupError.failedRequest(descriptions: "A localized description of an error")

        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            XCTAssertEqual(error, SignupError.failedRequest(descriptions: "A localized description of an error"))
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

}
