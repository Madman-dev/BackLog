//
//  GameScoreBoardEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by Jack Lee on 1/23/24.
//  Copyright © 2024 Toptal. All rights reserved.
//

import Foundation

// Only define the data You'll be using
protocol GameScoreBoardEditorViewModel {
    var homeTeam: String { get }
    var awayTeam: String { get }
    var time: String { get }
    var score: String { get }
    var isFinished: Bool { get }
    
    var isPaused: Bool { get }
    func togglePause()
}
