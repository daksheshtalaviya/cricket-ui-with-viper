//
//  Bowler.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

class Bowler : Codable {
    
    let bowler      : String?
    let overs       : String?
    let maidens     : String?
    let runs        : String?
    let wickets     : String?
    let economyRate : String?
    let noBalls     : String?
    let wides       : String?
    let dots        : String?

    // Custom Properties
    var player: PlayerWithId?
    
    enum CodingKeys : String, CodingKey {

        case bowler      = "Bowler"
        case overs       = "Overs"
        case maidens     = "Maidens"
        case runs        = "Runs"
        case wickets     = "Wickets"
        case economyRate = "Economyrate"
        case noBalls     = "Noballs"
        case wides       = "Wides"
        case dots        = "Dots"
    }


}
