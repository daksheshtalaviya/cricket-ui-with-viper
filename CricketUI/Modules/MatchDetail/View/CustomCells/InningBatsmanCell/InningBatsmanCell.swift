//
//  InningBatsmanCell.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class InningBatsmanCell: UITableViewCell {

    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblPlayerPosition: UILabel!
    @IBOutlet weak var lblPlayerDescription: UILabel!
    @IBOutlet weak var lblRuns: UILabel!
    @IBOutlet weak var lblBalls: UILabel!
    @IBOutlet weak var lbl4s: UILabel!
    @IBOutlet weak var lbl6s: UILabel!
    @IBOutlet weak var lblStrikeRate: UILabel!
    
    var batsman: Batsman? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func configure() {
        
        lblPlayerName.text = batsman?.player?.value.nameFull
        lblPlayerPosition.text = batsman?.player?.value.displayPosition
        if let howOut = batsman?.howOut, !howOut.isEmpty {
            lblPlayerDescription.text = howOut
        } else {
            lblPlayerDescription.text = "Yet To Bat"
        }
        
        lblRuns.text = batsman?.runs
        lblBalls.text = batsman?.balls
        lbl4s.text = batsman?.fours
        lbl6s.text = batsman?.sixes
        lblStrikeRate.text = batsman?.strikeRate
    }
    
}

