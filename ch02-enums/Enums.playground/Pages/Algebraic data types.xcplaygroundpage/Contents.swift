//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Algebraic data types

/*
 - Enums are algebraic data types.
 
 Algebraic data types are types of 'composed data'.
 They include sum type and product type.
 
 - Sum Type은 '오로지 한 가지' 값인 것
 - Product Type은 '여러가지' 값이 될 수 있는 것
 👉🏻 그렇다면 앞서 이야기들을 돌아보면 구조체 == product type!
 */

//MARK: - Sum & Product Type
// id와 name - 책을 구분 지을 수 있는 두 가지 값이 담기면 PRODUCT
struct Books {
    let id: UUID
    let name: String
    let page: Int
}

// 책의 상황을 케이스별로 나누어 "한가지의 상태만 확인" - thus this is a SUM
enum Book {
    // 각 케이스별로 책의 상태를 확인하게 된다.
    case read
    case unread
}


import Foundation

enum Day {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

enum Age {
    case known(UInt8)
    case unknown
}

struct BooleanContainer {
    let first: Bool
    let second: Bool
}

BooleanContainer(first: true, second: true)
BooleanContainer(first: true, second: false)
BooleanContainer(first: false, second: true)
BooleanContainer(first: false, second: false)

enum PaymentType {
    case invoice
    case creditcard
    case cash
}
struct PaymentStatus {
    let paymentDate: Date?
    let isRecurring: Bool
    let paymentType: PaymentType
}
//
//// Alternatively, the enum and struct can be turned into a single struct.
//enum PaymentStatus {
//    case invoice(paymentDate: Date?, isRecurring: Bool)
//    case creditcard(paymentDate: Date?, isRecurring: Bool)
//    case cash(paymentDate: Date?, isRecurring: Bool)
//}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
