//
//  Venue.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

struct Venue : Codable {
    
    let id   : String?
    let name : String?

    enum CodingKeys : String, CodingKey {
        case id   = "Id"
        case name = "Name"
	}

}
