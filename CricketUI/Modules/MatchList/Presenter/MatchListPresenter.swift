//
//  MatchListPresenter.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation
import UIKit

final class MatchListPresenter: MatchListPresenterProtocol {
    
    private weak var view: (any MatchListViewProtocol)?
    private var interactor: MatchListInteractorInputProtocol
    var router: MatchListRouterProtocol
    
    init(view: any MatchListViewProtocol, interactor: MatchListInteractorInputProtocol, router: MatchListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(view: any MatchListViewProtocol) {
        self.view = view
        interactor.fetchMatchList()
    }
}

extension MatchListPresenter : MatchListInteractorOutputProtocol {
    
    func fetchListSuccess(matches: [MatchResponse]) {
        self.view?.show(matches: matches)
    }
    
    func fetchListFailure(error: Error) {
        
    }
}

