//: [Previous](@previous)

import Foundation

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// 외부에서 값을 담던 방식이 '주입'의 개념이 되는 것
let firstPerson = Person(name: "뉴진스최고")

//: [Next](@next)
