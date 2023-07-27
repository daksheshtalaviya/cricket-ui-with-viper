//
//  MatchListRouter.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class MatchListRouter: MatchListRouterProtocol {
    
    weak var viewController: UIViewController?
   
    static func createModule() -> UIViewController {
        
        let viewController = MatchListViewController(nibName: "MatchListViewController", bundle: nil)
        viewController.title = "Matches"
        let router = MatchListRouter()
        router.viewController = viewController
        
        let interactor = MatchListInteractor(repository: MatchListRepository())
        let presenter = MatchListPresenter(view: viewController, interactor: interactor, router: router)
        interactor.output = presenter

        viewController.presenter = presenter
        
        return viewController
    }
    
    static func setAsRootViewController(controller: UIViewController) {

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        
        let window = windowScene.windows.first ?? UIWindow(windowScene: windowScene)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
    func navigateToMatchDetailScreen(navigationController: UINavigationController?, match: MatchResponse) {
        
        DispatchQueue.main.async {
            let matchDetailModule = MatchDetailRouter.createModule()
            (matchDetailModule as? MatchDetailViewController)?.match = match
            navigationController?.pushViewController(matchDetailModule, animated: true)
        }
    }
    
}
