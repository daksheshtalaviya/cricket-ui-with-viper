//
//  MatchDetailPresenter.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation
import UIKit

enum Category : String {
    case batting       = "Batting"
    case extras        = "Extras"
    case totalRuns     = "Total Runs"
    case bowling       = "Bowling"
    case fallOfWickets = "Fall Of Wickets"
}

final class MatchDetailPresenter: MatchDetailPresenterProtocol {
    
    weak var view: (any MatchDetailViewProtocol)?
    private var interactor: MatchDetailInteractorInputProtocol
    private var router: MatchDetailRouterProtocol
    
    init(view: any MatchDetailViewProtocol, interactor: MatchDetailInteractorInputProtocol, router: MatchDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(view: any MatchDetailViewProtocol) {
        self.view = view
        interactor.fetchMatchDetail()
    }
    
    func saveSelectedTeamId(teamId: String, match: MatchResponse?) {
        guard let match else { return }
        fetchDetailSuccess(teamId: teamId, match: match)
    }

}

extension MatchDetailPresenter : MatchDetailInteractorOutputProtocol {
    
    func fetchDetailSuccess(teamId: String, match: MatchResponse) {
        guard let inning = match.innings?.first(where: {$0.battingTeam == teamId}) else { return }
//        let players = match.teams?[teamId]?.players ?? [:]
        
//        match.innings?.forEach({ inning in
//            inning.batsmen?.forEach({ batsman in
//                if let batsmanId = batsman.batsman,
//                let player = players[batsmanId] {
//                    batsman.player = (key: batsmanId, value: player)
//                }
//            })
//        })
        
        view?.show(inning: inning)
    }
    
}

