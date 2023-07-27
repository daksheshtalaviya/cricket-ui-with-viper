//
//  RootNavigationController.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class RootNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.prefersLargeTitles = true
        setNavigationBarHidden(false, animated: false)
        navigationBar.tintColor = .systemGray
    }
}
