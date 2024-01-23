//
//  GameScoreBoardEditorViewModelFromGame.swift
//  MVVMSwiftExample
//
//  Created by Jack Lee on 1/23/24.
//  Copyright © 2024 Toptal. All rights reserved.
//

import Foundation

class GameScoreBoardEditorViewModelFromGame: NSObject, GameScoreBoardEditorViewModel {
    let game : Game
    
    struct Formatter {
        static let durationFormatter: DateComponentsFormatter = {
            let dateFormatter = DateComponentsFormatter()
            dateFormatter.unitsStyle = .positional
            return dateFormatter
        }()
    }
    
    var homeTeam: String
    var awayTeam: String
    
    var time: String
    var score: String
    var isFinished: Bool
    
    var isPaused: Bool
    func togglePause() {
        if isPaused {
            startTimer()
        } else {
            pauseTimer()
        }
        
        self.isPaused = !isPaused
    }
    
    init(withGame game: Game) {
        self.game = game
        
        self.homeTeam = game.homeTeam.name
        self.awayTeam = game.awayTeam.name
        
        self.time = GameScoreBoardEditorViewModelFromGame.timeRemainingPretty(for: game)
        self.score = GameScoreBoardEditorViewModelFromGame.scorePretty(for: game)
        self.isFinished = game.isFinished
        self.isPaused = true
    }
    
    fileprivate var gameTime: Timer?
    fileprivate func startTimer() {
        let interval: TimeInterval = 0.001
        gameTimer = Timer.schedule(repeatInterval: interval) { timer in
            self.game.time += interval
            self.time = GameScoreBoardEditorViewModelFromGame.timeRemaininPretty(for: self.game)
        }
    }
    
    fileprivate func pauseTimer() {
        gameTimer?.invalidate()
        gameTimer = nil
    }
    
    fileprivate static func timeFormatted(totalMillis: Int) -> String {
        let millis: Int = totalMillis % 1000 / 100
        let totalSeconds: Int = millis / 1000
        
        // 이 계산이 어떻게 되지?
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60)
        
        return String(format: "%02d:%02d.%d", minutes, seconds, millis)
    }
    
    fileprivate static func timeRemainingPretty(for: Game) -> String {
        return timeFormatted(totalMillis: Int(game.time * 1000))
    }
    
    fileprivate static func scorePretty(for game: Game) -> String {
        return String(format: "\(game.homeTeamScore - \(game.awayTeamScore))")
    }
}
