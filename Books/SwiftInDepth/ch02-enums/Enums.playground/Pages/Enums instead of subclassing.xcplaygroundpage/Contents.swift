//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation // We need foundation for the Date type.

/*
 이론상 완벽한 subClassing은 실제 활용하는 상황에서 문제가 많이 발생한다.
 많이 동의하는 부분!
 
 higher class being the most abstract
*/

struct Run {
    let id: String
    let startTime: Date
    let endTime: Date
    let distance: Float
    let onRunningTrack: Bool
}

struct Cycle {
    
    enum CycleType {
        case regular
        case mountainBike
        case racetrack
    }
    
    let id: String
    let startTime: Date
    let endTime: Date
    let distance: Float
    let incline: Int
    let type: CycleType
}

let run = Run(id: "3", startTime: Date(), endTime: Date(timeIntervalSinceNow: 3600), distance: 300, onRunningTrack: false)

let cycle = Cycle(id: "4", startTime: Date(), endTime: Date(timeIntervalSinceNow: 3600), distance: 400, incline: 20, type: .mountainBike)


/*
 workout이라는 superClass를 활용하면 Run, Cycle 클래스 내에 담긴 프로퍼티를 줄일 수 있게 된다.
 겹치는 프로퍼티를 캡슐화하여 해당 superclass를 채택시키면 편할텐데 왜 superclassing이 안 좋을까!
 
 class Workout {
    let id: String
    let startTime: Date
    let endTime: Date
    let distance: Float
 }
 
 class Run: Workout {...}
 class Cycle: Workout {...}
 
 ____
 
 여러 문제점을 정리하면
 1. 클래스(class) 사용으로 제한된다는 점이 있다.
 상속을 활용해야하는 만큼, 데이터가 무거워지게 된다.
 
 2. 다른 클래스가 추가되거나 데이터가 더해지게 되면 상속을 어떻게 해야할지 superclass를 잘 생각해야한다.
 */
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
