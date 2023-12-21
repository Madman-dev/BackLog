//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation // We need foundation for the Date type.

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

struct Pushups {
    let repetitions: [Int]
    let date: Date
}

let run = Run(id: "3", startTime: Date(), endTime: Date(timeIntervalSinceNow: 3600), distance: 300, onRunningTrack: false)

let cycle = Cycle(id: "4", startTime: Date(), endTime: Date(timeIntervalSinceNow: 3600), distance: 400, incline: 20, type: .mountainBike)

let pushups = Pushups(repetitions: [22,20,10], date: Date())

enum Workout {
    case run(Run)
    case cycle(Cycle)
    case pushups(Pushups)
}

let workout = Workout.pushups(pushups)


switch workout {
case .run(let run):
    print("Run: \(run)")
case .cycle(let cycle):
    print("Cycle: \(cycle)")
case .pushups(let pushups):
    print("Pushups: \(pushups)")
}

// ======================================================================

struct Arm {
    let duration: Int
    let set: [Int]
    let muscleGained: Bool
}

struct Leg {
    let duration: Int
    let set: [Int]
    let muscleGained: Bool
}

struct Abs {
    let duration: Int
    let set: [Int]
    let muscleGained: Bool
}

struct Chest {
    let muscleGained: Int
    let set: [Int]
}

// superclass 개념으로 접근하지 않고 - enum을 통해 타입을 변경할 수 있게 된다.
enum PersonalTraining {
    case arm([Arm]) // 단일 데이터를 넘어서도 데이터를 확인할 수 있겠네
    case leg(Leg)
    case abs(Abs)
    case chest(Chest)
}

let bicepFold = Arm(duration: 30, set: [10,10], muscleGained: true)
//let training = PersonalTraining.arm(bicepFold)

let pushUp = Arm(duration: 10, set: [10, 10], muscleGained: false)
let training2 = PersonalTraining.arm([bicepFold, pushUp])

let situp = Abs(duration: 5, set: [4, 5], muscleGained: true)
let training3 = PersonalTraining.abs(situp)


switch training2 { // Chest를 더했을 경우 - exhaustive 에러도 발생
case .abs(let abs):
    print("\(abs)가 탄탄해졌다.")
case .arm(let arm):
    print("\(arm)가 탄탄해졌다.")
case .leg(let leg):
    print("\(leg)가 탄탄해졌다.")
case .chest(let chest):
    print("가슴 운동은 \(chest)입니다.")
}

// ⭐️ enum을 사용했을 때의 또 다른 장점은 새로운 타입을 추가할 경우, 별도로 고칠 필요가 없다는 점. 해당 Enum에 새로 추가된 타입을 더하게 되면 덧붙여지게 된다. - 예시 chest

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
