//
//  MatchDetailProtocol.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation
import UIKit

// View
protocol MatchDetailViewProtocol: AnyObject {
    
    func show(inning: Inning)
}


// Interactor
protocol MatchDetailInteractorInputProtocol: AnyObject {
    func fetchMatchDetail()
}

protocol MatchDetailInteractorOutputProtocol: AnyObject {

    func fetchDetailSuccess(teamId: String,match: MatchResponse) 
}

protocol MatchDetailRepositoryProtocol: AnyObject {
    func fetchMatchDetail(matchId: String, completion: @escaping (Result<MatchResponse, Error>) -> Void)
}



// Presenter
protocol MatchDetailPresenterProtocol: AnyObject {
    func viewDidLoad(view: any MatchDetailViewProtocol)
}



// Router
protocol MatchDetailRouterProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    func navigateToMatchListScreen(navigationController: UINavigationController?) 
}
