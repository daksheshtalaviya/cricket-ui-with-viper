//
//  MatchListRepository.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation
import Combine

final class MatchListRepository: MatchListRepositoryProtocol {
  
    typealias T = [Team]
    
    var cancellableSet: Set<AnyCancellable> = []

    func fetchMatchDetail(matchId: String, completion: @escaping (Result<MatchResponse, Error>) -> Void) {
        let request: APIManager = .matchDetail(id: matchId)
        request.execute()
            .sink(receiveCompletion: { subCompletion in
                if case .failure(let error) = subCompletion {
                    completion(Result.failure(error))
                }
            }, receiveValue: { (match: MatchResponse) in
                dump(match)
                completion(Result.success(match))
            })
            .store(in: &cancellableSet)
    }
    
}
