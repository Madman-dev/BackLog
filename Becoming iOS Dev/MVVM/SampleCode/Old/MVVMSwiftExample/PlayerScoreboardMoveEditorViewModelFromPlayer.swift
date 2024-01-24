//
//  PlayerScoreboardMoveEditorViewModelFromPlayer.swift
//  MVVMSwiftExample
//
//  Created by Jack Lee on 1/24/24.
//  Copyright © 2024 Toptal. All rights reserved.
//

import Foundation

class PlayerScoreboardMoveEditorViewModelFromPlayer: NSObject, PlayerScoreboardMoveEditorViewModel {
    fileprivate let player: Player
    fileprivate let game: Game
    
    // protocol 적용
    let playerName: String
    
    var onePointMoveCount: String
    var twoPointMoveCount: String
    var assistMoveCount: String
    var reboundMoveCount: String
    var foulMoveCount: String
    
    func onePointMove() {
        makeMove(.onePoint)
    }
    func twoPointMove() {
        makeMove(.twoPoints)
    }
    
    func assistMove() {
        makeMove(.assist)
    }
    
    func foulMove() {
        makeMove(.foul)
    }
    
    func reboundMove() {
        makeMove(.rebound)
    }
    
    //init
    init(withGame game: Game, player: Player) {
        self.game = game
        self.player = player
        
        self.playerName = player.name
        self.onePointMoveCount = "\(game.playerMoveCount(for: player, move: .onePoint))"
        self.twoPointMoveCount = "\(game.playerMoveCount(for: player, move: .twoPoints))"
        self.assistMoveCount = "\(game.playerMoveCount(for: player, move: .assist))"
        self.foulMoveCount = "\(game.playerMoveCount(for: player, move: .foul))"
        self.reboundMoveCount = "\(game.playerMoveCount(for: player, move: .rebound))"
    }
    
    fileprivate func makeMove(_ move: PlayerInGameMove) {
        game.addPlayerMove(move, for: player)
        
        self.onePointMoveCount = "\(game.playerMoveCount(for: player, move: .onePoint))"
        self.twoPointMoveCount = "\(game.playerMoveCount(for: player, move: .twoPoints))"
        self.assistMoveCount = "\(game.playerMoveCount(for: player, move: .assist))"
        self.foulMoveCount = "\(game.playerMoveCount(for: player, move: .foul))"
        self.reboundMoveCount = "\(game.playerMoveCount(for: player, move: .rebound))"
    }
}
