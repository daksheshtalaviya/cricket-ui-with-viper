//
//  MatchListProtocol.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation
import UIKit

// View
protocol MatchListViewProtocol: AnyObject {
    
    func show(matches: [MatchResponse])
}



// Interactor
protocol MatchListInteractorInputProtocol: AnyObject {
    func fetchMatchList()
}

protocol MatchListInteractorOutputProtocol: AnyObject {

    func fetchListSuccess(matches: [MatchResponse])
    func fetchListFailure(error: Error)
}

protocol MatchListRepositoryProtocol: AnyObject {
    func fetchMatchDetail(matchId: String, completion: @escaping (Result<MatchResponse, Error>) -> Void)
}



// Presenter
protocol MatchListPresenterProtocol: AnyObject {
    func viewDidLoad(view: any MatchListViewProtocol) 
}



// Router
protocol MatchListRouterProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    func navigateToMatchDetailScreen(navigationController: UINavigationController?, match: MatchResponse)
}
