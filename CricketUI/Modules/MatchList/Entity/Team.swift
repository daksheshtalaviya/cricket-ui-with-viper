//
//  Team.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

struct Team: Codable, Equatable {
    
    let nameFull  : String?
    let nameShort : String?
    let players   : [String : Player]?

    enum CodingKeys : String, CodingKey {
        case nameFull  = "Name_Full"
        case nameShort = "Name_Short"
        case players = "Players"
    }
    
    static func == (lhs: Team, rhs: Team) -> Bool {
        lhs.nameShort == rhs.nameShort
    }
}
