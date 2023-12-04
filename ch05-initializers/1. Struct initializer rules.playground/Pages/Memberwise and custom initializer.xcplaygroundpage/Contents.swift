//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import UIKit

//: # A memberwise and custom initializer

enum Pawn: CaseIterable {
    case dog, car, ketchupBottle, iron, shoe, hat
}

struct Player {
    let name: String
    let pawn: Pawn
}

extension Player {
    
    init(name: String) {
        self.name = name
        self.pawn = Pawn.allCases.randomElement()!
    }
}

let player = Player(name: "SuperJeff")
let anotherPlayer = Player(name: "Mary", pawn: .dog)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
