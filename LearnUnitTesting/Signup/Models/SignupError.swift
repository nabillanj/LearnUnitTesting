//
//  SignupError.swift
//  LearnUnitTesting
//
//  Created by nabilla on 21/11/20.
//  Copyright © 2020 nabilla. All rights reserved.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(descriptions: String)

    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
}
