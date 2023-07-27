//
//  TeamSegmentControl.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import UIKit

class TeamSegmentControl : UISegmentedControl {
    
    var teamIds: [Int: String] = [:]
    
    func setTeamId(_ teamId: String?, forSegmentAt segment: Int) {
        teamIds[segment] = teamId
    }

}
