//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

/*
 배열은 순차적으로 데이터를 나열하지만 Any 타입을 담고 있을 경우
 compile time에 어떤 데이터 타입인지 파악하기 쉽지 않음.
 타입에 대해 명시를 하는 방식은 개발자 입장에서 처리하거나 추가 개선을 할 수 있는 구조이기에 Any를 유지하지 않는 방향이 좋다.
 */
let arr: [Any] = [Date(), "Why was six afraid of seven?", "Because...", 789]

for element in arr {
    // element is "Any" type
    switch element {
    case let stringValue as String: "received a string: \(stringValue)"
    case let intValue as Int: "received an Int: \(intValue)"
    case let dateValue as Date: "received a date: \(dateValue)"
    default: "I don't want anything else"
    }
}

enum DateType { // two types of dates are available
    case singleDate(Date)
    case dateRange(Range<Date>)
//    case year(Int8) // Uncomment to see compiler complaints
}

let now = Date()
let hourFromNow = Date(timeIntervalSinceNow: 3600)

let dates: [DateType] = [
    DateType.singleDate(now),
    DateType.dateRange(now..<hourFromNow)
]

for dateType in dates {
    switch dateType {
    case .singleDate(let date): print("Date is \(date)")
    case .dateRange(let range): print("Range is \(range)")
    }
}

// _______________ Practice

enum NoType {
    case singleData(Date)
    case multiData(Range<Date>)
}

let data: [NoType] = [
    NoType.singleData(Date.now),
    NoType.multiData(Date.now..<Date(timeIntervalSinceNow: 3600))
]

for microData in data {
    switch microData {
    case .singleData(let newData): print("이러네요 \(newData)")
    case .multiData(let forward): print("어머나 \(forward)")
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
