//
//  Batting.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

struct Batting : Codable {
    
    let style      : String?
    let average    : String?
	let strikeRate : String?
    let runs       : String?

    enum CodingKeys : String, CodingKey {
        case style      = "Style"
        case average    = "Average"
        case strikeRate = "Strikerate"
        case runs       = "Runs"
	}

}
