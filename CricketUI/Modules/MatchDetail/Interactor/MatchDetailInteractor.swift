//
//  MatchDetailInteractor.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

class MatchDetailInteractor: MatchDetailInteractorInputProtocol {
    
    weak var output: (any MatchDetailInteractorOutputProtocol)?
    
    private let repository: any MatchDetailRepositoryProtocol
    
    init(repository: any MatchDetailRepositoryProtocol) {
        self.repository = repository
    }
        
    func fetchMatchDetail() {
        
        guard let matchDetailPresenter = output as? MatchDetailPresenter,
        let controller = matchDetailPresenter.view as? MatchDetailViewController,
        let match = controller.match,
        let teamId = match.teams?.first?.key else { return }
        
        output?.fetchDetailSuccess(teamId: teamId, match: match)
    }
}


