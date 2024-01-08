//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Algebraic data types

/*
 - Enums are algebraic data types.
 
 Algebraic data types are types of 'composed data'.
 They include sum type and product type.
 
 - Sum Type은 '오로지 한 가지' 값인 것
 - Product Type은 '여러가지' 값이 될 수 있는 것 (tuples and structs)
 👉🏻 그렇다면 앞서 이야기들을 돌아보면 구조체 == product type!
 *REMEMBER THAT ENUMS ENABLE A 'OR' action to your code
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

// we can relate within the following enum contains sum of 7 which could vary according to the types we give to the values.
enum Day {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

/*
 //MARK: - Sum Type
 which in the following increases the case number to 2 ~ 257, case를 2개로 할당했음에도 불구하고 값의 제한을 풀어버리는 이유는 뭘까?
 Enum의 가장 큰 장점은 OR 형식으로 사용할 수 있다는 점 아니였나?
 */
enum Age {
    case known(UInt8)
    case unknown
}

/*
//MARK: - Product Type
 Multiplies possible values it contains.
 */
struct BooleanContainer {
    let first: Bool
    let second: Bool
}

// like so > careful consideration when using Enums to model your data. The higher the number of possible values, higher possibility that the type has, a better reason for the type to have numerous states. (it could be either true AND false or one of either.)
BooleanContainer(first: true, second: true)
BooleanContainer(first: true, second: false)
BooleanContainer(first: false, second: true)
BooleanContainer(first: false, second: false)

// --------

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



//MARK: - Test Code
// 3 ways user can figure out their phone status
//enum ProductCondition {
//    case working
//    case broken
//    case gone
//}
//
////struct ProductStatusCheck {
////    let name: String
////    let status: ProductCondition
////    let handedIn: Bool
////}

enum ProductStatusCheck {
    case working(name: String, handedIn: Bool)
    case broken(name: String, handedIn: Bool)
    case gone(name: String, handedIn: Bool)
}

/*
 이를 활용해서 enum을 조금은 다르게 활용할 수 있게 된다.
 case별로 값을 줄 수 있다는 점!
 
 enum 속에 구조체의 데이터 타입들을 정리하면 하나의 이름으로 데이터를 둘 다 명시할 수 있게 된다.
 Being algebraic type - it's able to turn into a product type from a sum type(?)
 
 Question.
 Data redundancy가 반복될 부분이 있는데, 이건 어떻게 해야하는건가?
 enum을 통해 데이터를 3가지로 구분 지을 수 있지만 name: String, HandedIn:Bool이 세번 이상 반복될 가능성이 존재한다.
 더불어 새로운 데이터를 더하게 되면 추가로 작성해야하는 불편함이 존재할텐데... 이건 그냥 제외를 해야하는건가?
 
 책에서도 언급하기를 dealing with single type - the Price is that you have some repetition within each case라고 언급을 한다~
 이러한 접근 법이 있다 + 데이터를 모델링할 때 나름 유용하게 활용할 수 있다는 점에서 고민할 점을 하나 배움!
*/ 


//MARK: - Exercise

/*
 1.  Bagel's possible variations - 3toppings, 4 types, 2 ways to merge them would lead to 24ways to create a single type of bagel
 2.  try changing the Bagle into an enum
 */

enum Topping {
    case creamCheese
    case peanutButter
    case jam
}

enum BagelType {
    case cinnamon
    case glutenFree
    case oatMeal
    case blueberry
}

//struct Bagel {
//    let topping: Topping
//    let type: BagelType
//}

// transform into Enum
enum Bagel {
    case plain // none of the above
    case withTopping(topping: Topping, type: BagelType)
 }

let breakfast = Bagel.withTopping(topping: .creamCheese, type: .blueberry)
let plain = Bagel.plain



enum Puzzle {
    case baby(numberOfPieces: Int)
    case toddler(numberOfPieces: Int)
    case preschooler(numberOfPieces: Int)
    case gradeschooler(numberOfPieces: Int)
    case teenager(numberOfPieces: Int)
}

// 타입 속에 enum으로 돌려 넣기 -> Like How did for my CustomTextField
struct Puzzles {
    enum Grade {
        case baby
        case toddler
        case preschooler
        case gradeschooler
        case teenager
    }
    
    let age: Grade
    let numberOfPieces: Int
}


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
