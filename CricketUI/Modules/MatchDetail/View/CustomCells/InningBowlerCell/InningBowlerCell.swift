//
//  InningBowlerCell.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class InningBowlerCell: UITableViewCell {

    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblPlayerPosition: UILabel!
    @IBOutlet weak var lblRuns: UILabel!
    @IBOutlet weak var lblOvers: UILabel!
    @IBOutlet weak var lblMaiden: UILabel!
    @IBOutlet weak var lblWicket: UILabel!
    @IBOutlet weak var lblEconomy: UILabel!
    
    var bowler: Bowler? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func configure() {
        
        lblPlayerName.text = bowler?.player?.value.nameFull
        lblPlayerPosition.text = bowler?.player?.value.displayPosition
        
        lblRuns.text = bowler?.runs
        lblOvers.text = bowler?.overs
        lblMaiden.text = bowler?.maidens
        lblWicket.text = bowler?.wickets
        lblEconomy.text = bowler?.economyRate
        
    }
    
}

