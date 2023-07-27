//
//  InningTitleHeaderView.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class InningTitleHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    var item: CategoryWithItem? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func configure() {
        
        lblTitle.text = item?.key.rawValue
        
        if let item {
            switch item {
            case (.extras, let inning) where inning is Inning:
                let inning = inning as! Inning

                lblSubtitle.isHidden = false
                lblSubtitle.text = inning.extras
                
            case (.totalRuns, let inning) where inning is Inning:
                let inning = inning as! Inning

                lblSubtitle.isHidden = false
                lblSubtitle.text = "\(inning.score) (\(inning.displayOvers))"
                
            default:
                lblSubtitle.isHidden = true
            }
        }
    }
    
}
