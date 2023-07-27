//
//  Bowling.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

struct Bowling : Codable {
    
    let style       : String?
    let average     : String?
	let economyRate : String?
    let wickets     : String?

    enum CodingKeys : String, CodingKey {

        case style       = "Style"
        case average     = "Average"
		case economyRate = "Economyrate"
        case wickets     = "Wickets"
	}


}
