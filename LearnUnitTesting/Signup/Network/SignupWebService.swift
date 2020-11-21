//
//  SignupWebService.swift
//  LearnUnitTesting
//
//  Created by nabilla on 21/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation

class SignupWebService {

    private var urlSession: URLSession
    private var urlString: String

    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }

    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        request.httpBody = try? JSONEncoder().encode(formModel)
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            //
            if let requestError = error {
                completionHandler(nil, SignupError.failedRequest(descriptions: requestError.localizedDescription))
                return
            } 
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
        dataTask.resume()
    }
    
}
