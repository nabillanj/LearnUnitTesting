//
//  SignupPresenter.swift
//  LearnUnitTesting
//
//  Created by nabilla on 22/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation

class SignupPresenter {

    private var formModelValidator: SignupModelValidatorProtocol?
    private var webService: SignupWebServiceProtocol?
    private weak var delegate: SignupViewDelegateProtocol?

    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }

    func processUserSignup(formModel: SignupFormModel){
        if !(formModelValidator?.isValidName(name: formModel.firstName) ?? false) {
            return
        }

        if !(formModelValidator?.isValidEmail(email: formModel.email) ?? false) {
            return
        }

        if !(formModelValidator?.isValidPassword(password: formModel.password) ?? false) {
            return
        }

        if !(formModelValidator?.checkPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) ?? false) {
            return
        }

        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)

        webService?.signup(withForm: requestModel, completionHandler: { (responses, error) in
            if let _ = responses {
                self.delegate?.successfullSignup()
                return
            }
        })
    }
    
}
