//: [Previous](@previous)

import Foundation

func greetUser() {
    print("Hi there")
}

greetUser()
//var greetCopy = greetUser()   >> this makes the print values copied into the var
var greetCopy = greetUser       // this makes the function copied into the var
greetCopy() // () to make the func and closure to run


let sayHello = {
    print("안녕? 이게 클로저야")
}

sayHello()

let sayHello1 = { (name: String) -> String in
    "Hi, \(name)"
}
sayHello1("Jack")


func greetUser1() {
    print("Hello there")
}

// () no parameter, returns nothing (Void)
var greetCopy1: () -> Void = greetUser1

func getUserData(for id: Int) -> String {
    if id == 1993 {
        return "Jack"
    } else {
        return "Who..?"
    }
}

let data: (Int) -> String = getUserData
let user = data(1993)   // 클로저로 호출을 할 때는 label이 붙지 않는다.
print(user)


let sayHello2 = { (name: String) -> String in
    "Hi there \(name)"
}
sayHello2("Steve")



let team = ["Gloria", "Suzan", "Piper", "Jack", "John"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzan" {
        return true
    } else if name2 == "Suzan" {
        return false
    }
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

/// 클로저를 변수로 활용하는 방법
let captainFirstTeam = team.sorted(by: { (a: String, b: String) -> Bool in
    // normal function code
    if a == "Suzan" {
        return true
    } else if b == "Suzan" {
        return false
    }
    return a < b
})

print(captainFirstTeam)

//: [Next](@next)
