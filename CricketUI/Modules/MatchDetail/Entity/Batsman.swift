//
//  Batting.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

class Batsman : Codable {
    
    let batsman    : String?
    let runs       : String?
    let balls      : String?
    let fours      : String?
    let sixes      : String?
    let dots       : String?
    let strikeRate : String?
    let dismissal  : String?
    let howOut     : String?
    let bowler     : String?
    let fielder    : String?
    
    // Custom Properties
    var player: PlayerWithId?
    
    enum CodingKeys : String, CodingKey {

        case batsman    = "Batsman"
        case runs       = "Runs"
        case balls      = "Balls"
        case fours      = "Fours"
        case sixes      = "Sixes"
        case dots       = "Dots"
        case strikeRate = "Strikerate"
        case dismissal  = "Dismissal"
        case howOut     = "Howout"
        case bowler     = "Bowler"
        case fielder    = "Fielder"
    }


}
