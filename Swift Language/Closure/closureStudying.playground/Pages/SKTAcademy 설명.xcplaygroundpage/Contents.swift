//: [Previous](@previous)

import Foundation
// 클로저 사용 API

var a = 11

func greeting() -> () -> () {
    func sayGoodMorning() {
        print(a)
    }
    return sayGoodMorning       // 에러가 없네?? 오...?
}

let greet = greeting()
greet()


// 클로저 표현식으로 작성 - inline
/// 아래에서 greeting2() -> (() -> ())를 해도 되고 () -> () -> ()도 되네
func greeting2() -> () -> () {
    return { () -> () in
        print("Good Morning")
    }
}

func greeting3() -> () -> () {
    return { print("Good Moooorning") }
}

let sayHi = greeting3()
sayHi()


// 클로저 파라미터로 사용
func add(_ i: Int, _ j: Int) -> Int {
    let sum = i + j
    return sum
}

let newSum = add(1,3)
print(newSum)


func add2(_ i: Int, _ j: Int, _ handler: (Int) -> Void) {
    let sum = i + j
    handler(sum)    // handler는 Int를 받는 return이 return type이 Void인 함수
}

add2(3, 4, { (result: Int) -> Void in
    print("3 + 4 = \(result)")
})

// 축약
add2(3, 4, { result in
    print("3 + 4 = \(result)")
})

add2(3, 4) { result in
    print("3 + 4 = \(result)")
}


//MARK: - closure를 사용한 optional
/// parameter의 타입이 ?인 클로저
//func multiply(_ i: Int, _ j: Int, _ handler: ((Int) -> Void?)   // optional을 사용할 수 있게 되면 nil 값, closure을 넣을 수 있게 된다.
                                                                  // Void?를 통해 nil을 대입할 수 있도록 만들었다...

/// return 값이 nil인 클로저
func sayHello() -> (() -> ())? {
    return nil          // return type을 no parameter, no return type?, optional로 선언을 했기 때문에 nil로 반환이 가능해진다.
}

/// print와 return 차이점 확인 -> 개인
//var aa = 11
//
//func tryThis() -> () {
//    print(aa)
//}

/// 프로퍼티로 클로저
class MyClass {
    var property: (() -> Int)!
}

var obj = MyClass()
obj.property = {
    return 0
}


//class MyClosureClass {
//    var value = 0
//
//    func showAndPrint() -> () {
//        return {
//            print(self.value)       // 클로저에서 property에 접근을 할 때는 self 키워드를 사용해야한다!
//        }
//    }
//}


//MARK: - closure와 캡쳐

//closure은 생성된 곳과 사용되는 곳이 다르다?
// 그렇기에 클로저는 사용하기에 필요한 정보들을 '캡쳐' 해서 사용한다

// 클로저 정의
func greetingAnew() -> () -> () {
    let str = "Hello"       // closure 'captures' this value and references to it
    
    return {
        print(str)
    }
}

// 클로저 호출
let str = "GoodMorning"
let ret = greetingAnew()
ret()                       // 해당 클로저가 실행하는 값은 내부 프로퍼티로 가진 str 값, NOT 외부에 있던 값



// 클로저 캡쳐 - 값 >> 만들어진 객체끼리 서로 다른 값을 보유할 수 있다. 자신이 호출될 때만 해당 값이 변경되며 다른 객체들은 영향을 줄 수 없다.
// ⭐️ In other words, each closure operates on its own private copy of count and maintains its own separate state.
func increment(by amount: Int) -> () -> () {
    var count = 0
    return {
        count += amount
        print(count)
    }
}

var step2 = increment(by: 2)
step2()
step2()

var step3 = increment(by: 3)
step3()
step3()

var step4 = increment(by: 4)
step4()
step4()
step2()


// 클로저 캡쳐 - 참조 타입 객체 캡쳐 >> 객체를 만들어낼 때마다 모든 객체들은 하나의 값만 참조를 하고 있기에 모두 변경을 줄 수 있다
class Myclass {
    var value = 0
}

func increment2(by amount: Int) -> () -> () {
    let obj = Myclass()
    return {
        obj.value += amount
        print(obj.value)
    }
}

// local variable를 참조한다는 점은 호출이 되지 않는 이상 각자 서로만의 값을 가지고 있다라는 점. reference도 동일하지만,
// reference variable는 이미 함수를 보유하고 있는 객체를 복사할 경우,
// 복사된 객체에서도 '복사한' 원본 객체의 값에 변경을 줄 수 있다! > ⭐️ 참조하고 있기에 reference counting도 올라간다.
let obj1 = increment2(by: 2)
obj1()
obj1()

let obj2 = obj1
obj2()
obj2()


//MARK: - no escaping && escaping

/// no escaping
//함수 파라미터로 클로저를 전달할 때 사용한다.
//함수 외부에 사용하지 않도록 하는 게 no escaping.

///아래 코드는 불가능
//class MyClass {
//    var prop: (() -> ())
//    func closureFunc(_ argument: () -> ()) {
//        self.prop - argument
//    }
//}

/// 아래처럼 다른 함수내에 활용은 가능 -> 함수 안에 갇히는 no escaping 구조이기에.
/// No escaping이 클로저의 기본 구성이라고 하는데, 왜 쓰는거지?
func closureFunc(_ arg: () -> ()) {
    otherFunc(arg)
}

func otherFunc(_ arg: () -> ()) {
    arg()
}

/// escaping
//class MyClass2 {
//    var prop: (() -> ())
//    func closureFunc(_ arg: @escaping () -> ()) {
//        self.prop = arg
//    }
//}

/// escaping과 no escaping은 섞일 수 없다
//func noEscapingFunc(_ arg: () -> ()) {
//    escapingFunc(arg)
//}
//
//func escapingFunc(_ arg: @escaping () -> ()) {
//    arg()
//}

//: [Next](@next)
