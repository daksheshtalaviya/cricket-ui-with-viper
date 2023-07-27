//
//  InningFallOfWicketCell.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class InningFallOfWicketCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    var players: [FallOfWicket] = [] {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func configure() {
        
        let wickets = players.enumerated().compactMap({ (index, wicket) -> String? in
            guard let playerName = wicket.player?.value.nameFull,
                  let score = wicket.score,
                  let overs = wicket.overs else { return nil }
            return "\(score)/\(index + 1)" + " (\(playerName), \(overs) ov)"
        })
        lblTitle.text = wickets.compactMap({"• " + $0})
            .joined(separator: "\n")
    }
    
}

