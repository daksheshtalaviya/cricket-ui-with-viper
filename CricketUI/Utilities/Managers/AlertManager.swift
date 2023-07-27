//
//  AlertManager.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

final class AlertManager
{

    typealias AlertActionHandler = ((UIAlertAction) -> ())

    enum CEAlertType {
        case normal
    }
    
    struct AlertAction {
        var title: String
        var actionStyle: UIAlertAction.Style
        
        init(Title title: String, ActionStyle actionStyle: UIAlertAction.Style) {
            self.title = title
            self.actionStyle = actionStyle
        }
    }
    
    static func showAlert(withTitle title: String? = nil,
                   Message message: String? = nil,
                          ActionButtons buttons: [AlertAction]? = [AlertAction(Title: "Dismiss", ActionStyle: .default)],
                   Style style: UIAlertController.Style = .alert,
                   Direction arrowDirection: UIPopoverArrowDirection = .any,
                   ViewController viewController: UIViewController,
                   ActionCompletion actionHandler : AlertActionHandler? = nil,
                   completion: (() -> Void)? = nil) {
        
        let vcAlert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if let buttons {
            for actionAlert in buttons {
                vcAlert.addAction(UIAlertAction(title: actionAlert.title, style: actionAlert.actionStyle, handler: { (actionDetect) in
                    
                    actionHandler?(actionDetect)
                }))
            }
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            vcAlert.popoverPresentationController?.sourceView = viewController.view
            vcAlert.popoverPresentationController?.permittedArrowDirections = arrowDirection
            if let viewPopup = viewController.view {
                vcAlert.popoverPresentationController?.sourceRect = viewPopup.bounds
            }
        }
        
        weak var currentController: UIViewController? = nil
        if let presentedController = viewController.presentedViewController {
            currentController = presentedController
        } else {
            currentController = viewController
        }
        
        if let currentController {
            DispatchQueue.main.async {
                currentController.present(vcAlert, animated: true, completion: completion)
            }
        }
    }
}

