//: [Previous](@previous)

import Foundation

// Customizing Initialization
// class UnitConversion {}
struct UnitConversion {
    var oz: Double = 0
    var ml: Double = 0
    
    init() {
        
    }
    
    init(oz: Double) {
        self.oz = oz
        self.ml = oz * 29.5
    }

    init(ml: Double) {
        self.ml = ml
        self.oz = ml / 29.5
    }
}

var unitConversion = UnitConversion(ml: 1)
unitConversion.ml
unitConversion.oz

var unitConversion2 = UnitConversion(oz: 1)
unitConversion2.ml
unitConversion2.oz

var unitConversion3 = UnitConversion()
unitConversion3.ml

//MARK: - Convenience Initialization
// 조건 >> 다른 init을 반드시 실행

class Profile {
    var name: String
    var age: Int
    var isAdult: Bool
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.isAdult = age > 19 ? true : false
    }
    
//    init(age: Int) {
//        self.name = ""
//        self.age = age
//        self.isAdult = age > 19 ? true : false
//    }
    
    // 하나의 init을 활용해서 생성을 하게 된다는 점,
    // 똑같은 로직을 여러번 반복하게 되면 버그를 생성하게 되는 것과 같다.
    convenience init(age: Int) {
        self.init(name: "", age: age)
    }
}


class MemberProfile: Profile {
    override init(name: String, age: Int) {
        super.init(name: name, age: age)
    }
}
