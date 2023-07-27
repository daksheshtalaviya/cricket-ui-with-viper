//
//  URLRequest+Extensions.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

public extension URLRequest {
    /// Returns the `httpMethod` as `HTTPMethod` type.
    var method: HTTPMethod? {
        get { return httpMethod.flatMap(HTTPMethod.init) }
        set { httpMethod = newValue?.rawValue }
    }

    func validate() throws {
        if method == .get, let bodyData = httpBody {
            throw APIError.urlRequestValidationFailed(reason: .bodyDataInGETRequest(bodyData))
        }
    }
}
