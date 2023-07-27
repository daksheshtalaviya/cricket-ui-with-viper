//
//  FallOfWickets.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

class FallOfWicket : Codable {
    
	let batsman : String?
    let score   : String?
    let overs   : String?
    
    // Custom Properties
    var player: PlayerWithId?
    
    enum CodingKeys : String, CodingKey {

		case batsman = "Batsman"
        case score   = "Score"
        case overs   = "Overs"
	}


}
