//
//  MatchListInteractor.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

class MatchListInteractor: MatchListInteractorInputProtocol {
    
    weak var output: (any MatchListInteractorOutputProtocol)?
    
    private let repository: any MatchListRepositoryProtocol
    
    init(repository: any MatchListRepositoryProtocol) {
        self.repository = repository
    }
        
    func fetchMatchList() {
        
        // nzin01312019187360, sapk01222019186652
        repository.fetchMatchDetail(matchId: "nzin01312019187360", completion: { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let match):
                match.updateModel()
                self.output?.fetchListSuccess(matches: [match])
            case .failure(let error):
                self.output?.fetchListFailure(error: error)
            }
        })
        
    }
}


