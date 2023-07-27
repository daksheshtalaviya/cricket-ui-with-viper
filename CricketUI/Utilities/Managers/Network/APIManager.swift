//
//  APIManager.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

enum APIManager {
    
    case matchDetail(id: String)
    
}

extension APIManager {
    
    /// Base URL of the request
    var baseUrl: String {
        let baseURL: String = "https://demo.sportz.io/"
        return baseURL
    }
    
    /// HTTP Method of the request
    var httpMethod: HTTPMethod {
        .get
    }
    
    /// End point of the request
    var endPoint: String {
        switch self {
        case .matchDetail(let id):
            return "\(id).json"
        }
    }
    
    /// Parameters of the request
    var parameters: [String: Any]? {
        switch self {
        case .matchDetail:
            return nil
        }
    }
    
    /// Parse response via key path
    var keyPath: String? {
        nil
    }
    
    /// Caching via URL
    var cacheUrl: String {
        switch self{
        default:
            return endPoint
        }
    }
    
    /// Request timeout interval
    var timeout: TimeInterval {
        switch self {
        default:
            return 30.0
        }
    }
    
    /// Custom headers
    var headers: [String : String]? {
        nil
    }
    
    /// Add response in cache storage
    var shouldCache: Bool {
        false
    }
    
    /// User can show the error
    var isDisplayError: Bool {
        true
    }
    
}
//
//extension APIManager {
//
//    func createRequest() throws -> URLRequest {
//        guard let url = baseUrl.url else { throw APIError.in }
//
//        var request = URLRequest(url: url, timeoutInterval: timeout)
//        request.httpMethod = httpMethod.rawValue
//        request.allHTTPHeaderFields = headers
//        return request
//    }
//}
//

extension APIManager: URLRequestConvertible {
    
    /// The `URL` formed by combining the base `URL` and the endpoint. (Optional)
    var urlWithEndPoint: URL? {
        let strURL: String = baseUrl + endPoint
        return strURL.url
    }
    
    /// Converts the API configuration into a URLRequest object.
    /// - Throws: An error of type `Error` if there is an issue in creating the URLRequest.
    /// - Returns: A URLRequest object representing the API request configuration.
    /// - Important: This method assumes that the API configuration is valid and all necessary properties are properly set.
    func asURLRequest() throws -> URLRequest {
        
        let urlMain : URL? = self.urlWithEndPoint
        guard let url = urlMain else {
            fatalError( "Request URL invalid for \(self)")
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        if let headers = self.headers, headers.count > 0 {
            headers.forEach { (key, value) in
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        var encodedURLRequest: URLRequest
        switch self {
        default:
            encodedURLRequest = try URLEncoding.queryString.encode(request as URLRequestConvertible, with: parameters)
        }
        
        encodedURLRequest.timeoutInterval = self.timeout
        
        print("""
\(#function)

🕒 API Request: \(Date().description):
URL: \(encodedURLRequest.httpMethod ?? "") : \(encodedURLRequest.url?.absoluteString ?? "")
Parameters: \(String(data: encodedURLRequest.httpBody ?? Data(), encoding: .utf8) ?? "")
HeaderFields: \(encodedURLRequest.allHTTPHeaderFields ?? [:])
""")
        
        return encodedURLRequest
    }
}
