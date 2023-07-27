//
//  MatchDetailRouter.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class MatchDetailRouter: MatchDetailRouterProtocol {
    
    weak var viewController: UIViewController?
   
    static func createModule() -> UIViewController {
        
        let viewController = MatchDetailViewController(nibName: "MatchDetailViewController", bundle: nil)
        viewController.title = "Match Detail"
        let router = MatchDetailRouter()
        router.viewController = viewController
        
        let interactor = MatchDetailInteractor(repository: MatchDetailRepository())
        let presenter = MatchDetailPresenter(view: viewController, interactor: interactor, router: router)
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
    
    func navigateToMatchListScreen(navigationController: UINavigationController?) {
        
        DispatchQueue.main.async {
            navigationController?.popViewController(animated: true)
        }
    }
    
}


