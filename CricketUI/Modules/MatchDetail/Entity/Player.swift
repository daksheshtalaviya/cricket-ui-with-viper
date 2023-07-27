//
//  Player.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

typealias PlayerWithId = (key: String, value: Player)
typealias PlayerSortedWithIds = [Dictionary<String, Player>.Element]

class Player : Codable, Equatable {
   
    let position  : String?
    let nameFull  : String?
    let isCaptain : Bool?
    let isKeeper  : Bool?
    let batting   : Batting?
    let bowling   : Bowling?

    enum CodingKeys : String, CodingKey {
        case position  = "Position"
        case nameFull  = "Name_Full"
        case isCaptain = "Iscaptain"
        case isKeeper  = "Iskeeper"
        case batting   = "Batting"
        case bowling   = "Bowling"
    }

    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.nameFull == rhs.nameFull
    }
    
}

extension Player {
    
    var displayPosition: String? {
        var positions: [String] = []
        if isCaptain ?? false {
            positions.append("c")
        }
        if isKeeper ?? false {
            positions.append("wk")
        }
        
        if positions.isEmpty {
           return nil
        }
        return "(\(positions.joined(separator: " & ")))"
    }
    
    var styles: String? {
        var positions: [String] = []
        
        if let batting, let style = batting.style, !style.isEmpty {
            positions.append("Batting Style: \(style)")
        }
        if let bowling, let style = bowling.style, !style.isEmpty {
            positions.append("Bowling Style: \(style)")
        }
        
        return positions.joined(separator: "\n")
    }
}
