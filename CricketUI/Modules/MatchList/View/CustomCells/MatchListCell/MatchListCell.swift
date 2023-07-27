//
//  MatchListCell.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class MatchListCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTeamA: UILabel!
    @IBOutlet weak var lblTeamB: UILabel!
    @IBOutlet weak var lblTeamAScore: UILabel!
    @IBOutlet weak var lblTeamBScore: UILabel!
    @IBOutlet weak var lblTeamAOvers: UILabel!
    @IBOutlet weak var lblTeamBOvers: UILabel!
    @IBOutlet weak var lblTeamDate: UILabel!
    @IBOutlet weak var lblTeamResult: UILabel!
    
    var match: MatchResponse? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func configure() {
        
        lblDate.text = match?.matchDetail?.match?.displayDate

        let teams: [Team] = (Array((match?.teams ?? [:]).values))
            .sorted { teamA, teamB in
                let firstTeam = match?.innings?.first(where: {$0.number == .first})?.team
                if firstTeam == teamA {
                    return true
                }
                return false
            }
        
        let teamA = teams.first
        let teamB = teams.last

        lblTeamA.text = teamA?.nameFull
        lblTeamB.text = teamB?.nameFull
        
        let inningA = match?.innings?.first
        let inningB = match?.innings?.last
        
        lblTeamAScore.text = inningA?.score
        lblTeamBScore.text = inningB?.score
        
        lblTeamAOvers.text = inningA?.displayOvers
        lblTeamBOvers.text = inningB?.displayOvers
        
        lblTeamDate.text = [
            match?.matchDetail?.match?.league?.uppercased(),
            match?.matchDetail?.match?.number,
            match?.matchDetail?.venue?.name]
            .compactMap({$0}).joined(separator: ", ")
        lblTeamResult.text = match?.matchDetail?.result
        
    }
    
}

