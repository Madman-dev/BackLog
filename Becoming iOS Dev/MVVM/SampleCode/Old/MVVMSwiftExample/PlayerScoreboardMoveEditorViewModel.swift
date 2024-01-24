//
//  PlayerScoreboardMoveEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by Jack Lee on 1/24/24.
//  Copyright © 2024 Toptal. All rights reserved.
//

import Foundation

protocol PlayerScoreboardMoveEditorViewModel {
    var playerName: String { get }
    
    var onePointMoveCount: String { get }
    var twoPointMoveCount: String { get }
    var assistMoveCount: String { get }
    var reboundMoveCount: String { get }
    var foulMoveCount: String { get }
    
    func onePointMove()
    func twoPointMove()
    func foulMove()
    func reboundMove()
    func assistMove()
}
