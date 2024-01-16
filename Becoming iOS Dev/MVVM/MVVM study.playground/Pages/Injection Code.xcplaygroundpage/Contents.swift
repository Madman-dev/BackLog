//: [Previous](@previous)

import Foundation

/*
 프로토콜을 활용해서 의존성 주입을 이룰 수 있다!
 */

protocol FinalPiece {
    var name: String { get set }
}

class Bolt: FinalPiece {
    var name: String = "ulsan"
}

class Nut: FinalPiece {
    var name: String = "Nut"
}

class Final {
    // 프로토콜로 선언
    var a: FinalPiece
    
    init(a: FinalPiece) {
        self.a = a
    }
    
    func printName() {
        print(a.name)
    }
}

let finalA = Bolt()
let finalB = Nut()

// 주입을 하되, 프로토콜로 주입을 해서 해당 코드의 확장성을 더 넓게 만든다는 점이 의존성 주입이다~
let 진짜마지막 = Final(a: finalA)


// 의존 관계의 역전을 일으킬 수 있다
// 우리 프로젝트에서는 그렇다면 어떻게 사용이 될 수 있을까?

//: [Next](@next)
