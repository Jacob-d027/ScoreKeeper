//
//  Players.swift
//  Score Keeper
//
//  Created by Jacob Davis on 11/8/23.
//

import Foundation

struct Player: Comparable {
    
    var id: UUID
    var score: Int
    var name: String
    
    init(score: Int, name: String) {
        self.id = UUID()
        self.score = score
        self.name = name
    }
    
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        lhs.score < rhs.score
    }
    
    static func > (lhs: Player, rhs: Player) -> Bool {
        lhs.score > rhs.score
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.score == rhs.score
    }
}

var listOfPlayers = [Player]()
