//
//  APIManager+Combine.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noData
}

extension APIManager {
    
    func execute<Model: Decodable>() -> AnyPublisher<Model, Error> {
        do {
            return URLSession.shared.dataTaskPublisher(for: try asURLRequest())
                .tryMap(handleResponse)
                .decode(type: Model.self, decoder: JSONDecoder())
                .mapError(handleError)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
    }
    
    func handleResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode.httpStatusCode?.isSuccess == true else {
            throw NetworkError.invalidResponse
        }
        return data
    }
    
    func handleError(error: Error) -> Error {
        dump(error)
        return error
    }
}

extension APIManager {
    
    static func cancelRequest(cancellableSet: Set<AnyCancellable>) {
        cancellableSet.forEach(cancelRequest)
    }
    
    static func cancelRequest(cancellable: AnyCancellable) {
        cancellable.cancel()
    }
}
