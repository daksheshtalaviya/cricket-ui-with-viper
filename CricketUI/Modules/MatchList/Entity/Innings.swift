//
//  Innings.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

class Inning : Codable {
    
    enum Number: String, Codable {
        case first = "First"
        case second = "Second"
    }
    
    let number             : Number?
    let battingTeam        : String?
    let total              : String?
    let wickets            : String?
    let overs              : String?
    let runRate            : String?
    let byes               : String?
    let legByes            : String?
    let wides              : String?
    let noBalls            : String?
    let penalty            : String?
    let allottedOvers      : String?
    var batsmen            : [Batsman]?
//	let partnership_Current : Partnership_Current?
    let bowlers          : [Bowler]?
    let fallOfWickets    : [FallOfWicket]?
//    let powerPlay        : PowerPlay?

    // Custom Properties
    var team: Team?
    
    enum CodingKeys : String, CodingKey {

        case number          = "Number"
        case battingTeam     = "Battingteam"
        case total           = "Total"
        case wickets         = "Wickets"
        case overs           = "Overs"
        case runRate         = "Runrate"
        case byes            = "Byes"
        case legByes         = "Legbyes"
        case wides           = "Wides"
        case noBalls         = "Noballs"
        case penalty         = "Penalty"
        case allottedOvers   = "AllottedOvers"
        case batsmen         = "Batsmen"
//		case partnership_Current = "Partnership_Current"
        case bowlers       = "Bowlers"
        case fallOfWickets = "FallofWickets"
//        case powerPlay     = "PowerPlay"
	}

}

extension Inning {
    
    var score: String {
        [self.total ?? "0", self.wickets ?? "0"].joined(separator: " / ")
    }
    
    var displayOvers: String {
        [self.overs ?? "0.0", "ov"].joined(separator: " ")
    }
    
    var extras: String {
        let total: Int = byes.valueOrEmpty.toIntValue()
        + legByes.valueOrEmpty.toIntValue()
        + wides.valueOrEmpty.toIntValue()
        + noBalls.valueOrEmpty.toIntValue()
        return "\(total)"
    }
}
