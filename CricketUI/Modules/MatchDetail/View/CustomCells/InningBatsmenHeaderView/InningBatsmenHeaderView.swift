//
//  InningBatsmenHeaderView.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class InningBatsmenHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var title: String? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func configure() {
        
        lblTitle.text = title
    }
    
}
