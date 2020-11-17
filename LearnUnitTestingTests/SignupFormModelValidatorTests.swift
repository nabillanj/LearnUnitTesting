//
//  SignupFormModelValidatorTests.swift
//  LearnUnitTestingTests
//
//  Created by nabilla on 16/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import XCTest
@testable import LearnUnitTesting

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!

    // Arrange
    // Act
    // Assert

    override func setUp() {
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        sut = nil
    }

    // Name
    func testSignupFormModelValidator_WhenValidNameProvided_ShouldReturnTrue() {
        let isValidName = sut.isValidName(name: "Nabilla")
        XCTAssertTrue(isValidName, "isValidName() should return TRUE but it returned FALSE")
    }

    func testSignupFormModelValidator_WhenLongNameProvided_ShouldReturenFalse() {
        let isTooLongName = sut.isValidName(name: "Nabilla Nurjannah")
        XCTAssertFalse(isTooLongName, "isValidName() should return FALSE because name is too long than \(SignupConstant.validNameMaximumLength) but it returned TRUE")
    }

    func testSignupFormModelValidator_WhenEmptyNameProvided_ShouldReturnFalse() {
        let isEmptyName = sut.isValidName(name: "")
        XCTAssertFalse(isEmptyName, "isValidName() should return FALSE because name is empty")
    }

    func testSignupFormModelValidator_WhenNameOnlyContainsSpace_ShouldReturnFalse() {
        let spaceName = sut.isValidName(name: "       ")
        XCTAssertFalse(spaceName, "isValidName() should return FALSE because name is only contains spacing(no word)")
    }

    // Email
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        let isInvalidEmail = sut.isValidEmail(email: "name@example.id")
        XCTAssertTrue(isInvalidEmail, "isValidEmail() should return TRUE but it returned FALSE")
    }

    func testSignupFormModelValidator_WhenInvalidEmailProvided_ShouldReturnFalse() {
        let isInvalidEmail = sut.isValidEmail(email: "nameexampleid")
        XCTAssertFalse(isInvalidEmail, "isValidEmail() should return FALSE but it returned TRUE")
    }

    func testSignupFormModelValidator_WhenEmptyEmailProvided_ShouldReturnFalse() {
        let isEmptyEmail = sut.isValidEmail(email: "  ")
        XCTAssertFalse(isEmptyEmail, "isValidEmail() should return FALSE because user only give space to fill the email")
    }

    // Password
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        let isValidPassword = sut.isValidPassword(password: "Passw0rd123")
        XCTAssertTrue(isValidPassword, "isValidPassword() should return TRUE but it returned FALSE")
    }

    func testSignupFormModelValidator_WhenLongPasswordProvided_ShouldReturnFalse() {
        let isTooLongPassword = sut.isValidPassword(password: "PasswordTooooooooLongggggggHeypppppppMeeeeeeee12!!!!")
        XCTAssertFalse(isTooLongPassword, "isValidPassword() should return FALSE because name is too long than \(SignupConstant.validNameMaximumLength) but it returned TRUE")
    }

    func testSignupFormModelValidator_WhenPasswordIsMatch_ShouldReturnTrue() {
        let isMatchPassword = sut.checkPasswordMatch(password: "P@ssword123", repeatPassword: "P@ssword123")
        XCTAssertTrue(isMatchPassword, "Should return TRUE if password were match but it returned FALSE")
    }

    func testSignupFormModelValidator_WhenPasswordIsNOTMatch_ShouldReturnFalse() {
        let isMatchPassword = sut.checkPasswordMatch(password: "P@ssw0rd123", repeatPassword: "P@ssword123")
        XCTAssertFalse(isMatchPassword, "Should return FALSE because password not match, but it returned TRUE")
    }
}
