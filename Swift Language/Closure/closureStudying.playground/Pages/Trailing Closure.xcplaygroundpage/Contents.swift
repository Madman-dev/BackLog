//: [Previous](@previous)

import Foundation
/*
 - 1번째로 sorted의 경우, team에 담긴 값들이 단일 타입인걸 알기에 a,b: string 타입을 지워도 된다.
 - 2번째로 Bool을 돌리는 것도 sorted이기 때문에 지워도 된다.
 - 3번째로 a, b를 parameter 값으로 사용하지만 shorthand syntax로 인해 parameter 값도 바꿀 수 있다 ($0,$1)
 - 4번째로 하나의 값 - 클로저만 활용할 경우, return을 지워도 된다. (?) -> 반환 값이 한줄일경우 return이었나?
 */

let captainFirstTeam1 = team.sorted {
    // when using trailzing closure codes
    if $0 == "Suzan" {
        return true
    } else if $1 == "Suzan" {
        return false
    }
    return $0 < $1
}

let reversedTeam = team.sorted { $0 > $1 }

/*
 - Shorthand Syntax를 사용해야하는 규제는 없다.
 단, 이 사람은
 1. 클로저가 길 경우 - 의미 전달을 헤치지 않기 위해 X
 2. $0, $1 등이 반복되면 사용 X
 3. parameter 값이 너무 길어질 경우 사용 X
 */


let jOnly = team.filter { $0.hasPrefix("J")}
print(jOnly)

let uppercasedTeam = team.map { $0.uppercased() }
print(uppercasedTeam)



//MARK: - using funcions as parameters

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 5) {
    Int.random(in: 1...20)
}
print(rolls)



func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("Starting Second Work")
    second()
    print("Final work starting")
    third()
    print("Done!")
}

doImportantWork {
    print("this is the first work")
} second: {
    print("Second work")
} third: {
    print("This is third work")
}

//: [Next](@next)
