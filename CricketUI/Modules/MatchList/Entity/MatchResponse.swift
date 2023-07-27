//
//  MatchResponse.swift
//  CricketUI
//
//  Created by Dksh on 25/07/23.
//

import Foundation

struct MatchResponse: Codable {
    
    let matchDetail : MatchDetail?
    let nuggets     : [String]?
    let innings     : [Inning]?
    let teams       : [String : Team]?
//    let notes     : Notes?

    enum CodingKeys : String, CodingKey {

        case matchDetail = "Matchdetail"
        case nuggets     = "Nuggets"
        case innings     = "Innings"
        case teams       = "Teams"
//        case notes     = "Notes"
    }

}

extension MatchResponse {
    
    var teamHome: Team? {
        guard let teamId = matchDetail?.teamHome else { return nil }
        return teams?.team(teamId: teamId)
    }
    var teamAway: Team? {
        guard let teamId = matchDetail?.teamAway else { return nil }
        return teams?.team(teamId: teamId)
    }
}

extension MatchResponse {
    
    func updateModel() {
        updatePlayersInInnings()
    }
    
    private func updatePlayersInInnings() {
        guard let teams else { return }
        let allTeams: [Team] = Array(teams.values)

        let players = allTeams.compactMap { $0.players }
            .reduce(into: [:]) { result, next in
                result.merge(next) { (_, new) in new }
            }
        
        innings?.forEach({ inning in
            // Add Team
            if let battingTeamId = inning.battingTeam {
                inning.team = teams[battingTeamId]
            }
            
            // Add Player In Batsmen
            inning.batsmen?.forEach({ batsman in
                if let playerId = batsman.batsman,
                let player = players[playerId] {
                    batsman.player = (key: playerId, value: player)
                }
            })
            
            // Add Player In Bowlers
            inning.bowlers?.forEach({ bowler in
                if let playerId = bowler.bowler,
                let player = players[playerId] {
                    bowler.player = (key: playerId, value: player)
                }
            })
            
            // Add Player In Batsmen
            inning.fallOfWickets?.forEach({ batsman in
                if let playerId = batsman.batsman,
                let player = players[playerId] {
                    batsman.player = (key: playerId, value: player)
                }
            })
            
        })
    }
}

extension Dictionary where Key == String, Value == Team {
    
    func team(teamId: String) -> Team? {
        self[teamId]
    }
}
