//
//  Match.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

struct Match : Codable {
    
	let liveCoverage : String?
    let id           : String?
    let code         : String?
    let league       : String?
    let number       : String?
    let type         : String?
    let date         : String?
    let time         : String?
    let offset       : String?
    let dayNight     : String?

    enum CodingKeys : String, CodingKey {

		case liveCoverage = "Livecoverage"
        case id           = "Id"
        case code         = "Code"
        case league       = "League"
        case number       = "Number"
        case type         = "Type"
        case date         = "Date"
        case time         = "Time"
        case offset       = "Offset"
        case dayNight     = "Daynight"
	}

}

extension Match {
    
    var matchDate: Date? {
        guard let date,
              let convertToDate = DateFormatter.matchDetailAPI.date(from: date) else { return nil }
        return convertToDate
    }
    
    var displayDate: String? {
        guard let matchDate else { return nil }
        return DateFormatter.matchDetailUI.string(from: matchDate)
    }
}
