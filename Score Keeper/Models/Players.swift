//
//  Players.swift
//  Score Keeper
//
//  Created by Jacob Davis on 11/8/23.
//

import Foundation

class Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        lhs.score < rhs.score
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.score == rhs.score
    }
    
    var score: Int = 0
    var name: String = "Player"
    
}

var listOfPlayers: [Player] = []
