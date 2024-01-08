//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Enum with explicit raw values

import Foundation

/*
 enums with raw values are defined at compile time where as with associated types store values at runtime.
 Giving a direct value would allow the enum to figure out the data's Type during compile time.
 */

//enum Currency: String {
//    case euro = "euro"
//    case usd = "usd"
//    case gbp = "gdp"
//}

enum Currency: String {    // no need to give value if types are single.
    case euro = "eur"      // by giving a raw value to an enum, possible wrong typing issue rises
    case usd
    case gbp
}

let currency = Currency.euro
print(currency.rawValue)

// API 콜을 하는 상황에서 rawValue가 틀릴 경우를 가정해보자
let parameters = ["filter": currency.rawValue]
print(parameters) // ["filter": "euro"]


// 차라리 타입을 지정해서 안전하게 생성할 수도 있다.
let parameter: [String: String]

switch currency {
case .euro: parameter = ["유럽": "euro"]
case .gbp: parameter = ["영국": "gdp"]
case .usd: parameter = ["미국": "usd"]
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
