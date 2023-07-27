//
//  MatchDetail.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

struct MatchDetail : Codable {
    
    let teamHome     : String?
    let teamAway     : String?
    let match        : Match?
//    let series     : Series?
    let venue        : Venue?
//    let officials  : Officials?
    let weather      : String?
    let tossWonBy    : String?
    let status       : String?
    let status_Id    : String?
    let player_Match : String?
    let result       : String?
    let winningTeam  : String?
    let winMargin    : String?
    let equation     : String?

    
    enum CodingKeys : String, CodingKey {

        case teamHome     = "Team_Home"
        case teamAway     = "Team_Away"
        case match      = "Match"
//        case series     = "Series"
        case venue        = "Venue"
//        case officials  = "Officials"
        case weather      = "Weather"
        case tossWonBy    = "Tosswonby"
        case status       = "Status"
        case status_Id    = "Status_Id"
        case player_Match = "Player_Match"
        case result       = "Result"
        case winningTeam  = "Winningteam"
        case winMargin    = "Winmargin"
        case equation     = "Equation"
    }

}

extension String {
    
    func team(teams: [String : Team]?) -> Team? {
        teams?.team(teamId: self)
    }
}
