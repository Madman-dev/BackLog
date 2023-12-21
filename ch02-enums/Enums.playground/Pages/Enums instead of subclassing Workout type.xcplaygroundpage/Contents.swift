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

//MARK: - Choosing to use Enum or Struct
/*
 - 데이터가 변하지 않을 것이라는 확신 + 프로퍼티가 대량으로 공유가 되는 상황이라면 subClassing이 오히려 좋은 선택일 수 있다.
 - 하지만 subClassing은 좀 더 rigid hierarchy를 구성하게 만든다고 한다.
 - 더불어 class를 무조건 사용하게 된다.
 
 - 비슷한 타입이 의도했던 방향과 다르게 구성된다면 enum과 구조체를 활용하는 방향이 더 좋을 수도 있다.
 - encompassed Enum은 class를 꼭 사용하지 않아도 되기에...
 
 
 하지만 또 다르게 보면 enum은 제한적인 부분도 많다.
 case를 모두 다뤄야 한다는 점에서 귀찮은 부분일수도 있다. (type safe)
 + 책에 의하면 enum을 활용할 경우 서드 파티 라이브러리에서 enum의 모델을 변경할 권한이 없어진다고 한다.
 Locking Down a model to fixed number of cases >> at the time of writing, enums can' extend with new cases.
 */


//MARK: - Exercise

/*
 name two benefits of using subclassing instead of enums with associated types.
 1. although rigid, subclassing allows third party libraries to gain access to the model of the application.
 2. subClassing allows various structures to become a part of the class. This enable easier access to data as structures configure data during run time.
 
 name two benefits of using enums with associated types instead of subclassing?
 1. Enums allow developers to check on their code more with ease as they enable errors to be displayed during compile time
 2. Enums have easier means to add new Types of Data.
 */
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
