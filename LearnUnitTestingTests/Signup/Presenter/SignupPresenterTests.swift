//
//  SignupPresenterTests.swift
//  LearnUnitTestingTests
//
//  Created by nabilla on 22/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import XCTest
@testable import LearnUnitTesting

class SignupPresenterTests: XCTestCase {

    var sut: SignupPresenter!
    var mockSignupWebService: MockSignupWebService!
    var mockSignupModelValidator: MockSignupModelValidator!
    var signupFormModel: SignupFormModel!
    var mockupSignupViewDelegate: MockSignupViewDelegate!


    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Nabilla", lastName: "Nurjannah", email:"nabilla@avana.id", password: "nabilla123", repeatPassword: "nabilla123")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockupSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockSignupWebService,
                              delegate: mockupSignupViewDelegate)
    }

    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockupSignupViewDelegate = nil
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        sut.processUserSignup(formModel: signupFormModel)

        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordMatch)
    }

    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        sut.processUserSignup(formModel: signupFormModel)

        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup method was not called in the SignupWebService")
    }

    func testSignupPresenter_WhenSignupOperationSuccessfull_CallSuccessOnViewDelegate() {
        let myExpectation = expectation(description: "successfullSignup should be called")
        mockupSignupViewDelegate.expectation = myExpectation

        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
    }

    // TODO: error handling

}
