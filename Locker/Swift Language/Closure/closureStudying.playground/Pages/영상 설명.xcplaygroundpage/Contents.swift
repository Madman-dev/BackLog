//: [Previous](@previous)

import Foundation

/*
//MARK: - 인프런

/// function = named Closure이다!
func plus(a: Int, b: Int) -> Int {
    return a + b
}

//{ (a: Int, b: Int) -> Int in
//    return a + b
//}

//MARK: - 변수 상수에 closure을 담는 방식
var myClosure = { (a: Int, b: Int) -> Int in
    return a + b
}

plus(a: 10, b: 20)
myClosure(10, 20)

/*
 타입을 정의하기 위해서 이름을 앞에 작성하는데, 클로저는 없다!
 in으로 구분을 한다
 어디에 들어가 있어야 한다. -> 일종의 func처럼 이름을 대신하는 친구에게 넣어두는 구성?
 ⭐️ 클로저 내부에는 argument label이 없고 넣을 수도 없다! - a:, b:이런 친구들 대신 바로 값 입력
 
 */


//MARK: - function parameter에 closure을 넣어서 사용하는 방식

func f10(myClosure: () -> Void ) {  // ()인 이유는 파라미터로 들어가는 값이 없기 때문에
    print("작업 중...")
    print("작업 중...")
    
    myClosure()
}

func f20() {
    print("작업완료 로직")
}

f10(myClosure: { () -> Void in f20() })
f10(myClosure: { f20() })   // 타입과 in을 없앨 수 있다
f10{ f20() }    // 함수 이름을 없애도 된다

f10 { print("이렇게 구현도 가능") }     // print()내용은 위 f10()에 있는 myClosure이 호출되는 구간에서 출력이 된다



/*
 - 실제 일을 하다보면 주석이 있다고 해도 잊어버릴 수 있으며 코드를 까먹는 경우가 많다. 지금처럼 f1, f2가 순차적으로 나와야하는 값임에도 불구하고 깜박하고 순서를 바꾼다거나 실행을 바로 하지 않고 늦게 출력하도록 둔다면 문제가 발생하는 것
        e.g) f1(), f2()
 
 - 이걸 방지하고자 f1() 함수 안에 f2()를 넣어둘 순 있지만,
   f1을 실행했을 때 f2()가 실행된다고 생각할 수 있는 가능성은...? 없다는 것!~
     e.g)    func f1() {
                  print("작업 중...")

             f2()
             }
 
             func f2() {
                  print("작업 완료")
             }

             f1() << 이 친구만 실행
 */


//func + Closure
func myFunc(closure: () -> Void) {
    
}


//func + closure 2
func myFunc2(closure1: () -> Void, closure2: () -> Void) {
    print("func")
    closure1()
    closure2()
}

myFunc2 {
    print("closure1")
} closure2: {
    print("closure2")
}

//func + closure 3
func myFunc3(closure1: () -> Void, closure2: () -> Void, closure3: () -> Void) {
    print("Func")
    closure1()
    closure2()
    closure3()
}

myFunc3 {
    print("c1")
} closure2: {
    print("c2")
} closure3: {
    print("c3")
}


//closure + Parameter가 있는 경우

func myFunc5(completion: (Int) -> Void ) {
    print("func5...")
    let total = 100
    completion(total)
}


//myFunc5를 전달 하는걸로 이해하면 된다. 위의 함수로
myFunc5 { total in
    print(total.description + "점")
}

func showScore(a: Int) {
    print((a + 20).description + "점")
}

myFunc5(completion: showScore)


//closure + Return이 있는 경우
func newFunc(completion: () -> String) {
    print("newFunc")
    completion() + " HI"
}

newFunc {
    return String(10)
}


//MARK: - 인프런 - 3번째 >> capturing Value

var str = "A"
var str2 = str
var str3 = str2


class Student {
    var b = 10

    func someFunc() {       // 일반 함수가 객체를 참조하고 있다면?
        print(newStudent3)
//        self.b
    }
    
    /// lazy를 통해 바로 만들지 말고 조금 늦게 만들어지도록 하면 변수에 클로저를 담아 사용할 수 있따
    /// optional 타입으로 만들 수 있어야 closure을 메모리에서 해제시킬 수 있따.
    lazy var myClosure: (() -> Void)? = {   // 변수가 참조하고 있다?
        print(self.b)        // 에러가 발생하는 이유는 var b wasn't created yet, >> self를 써야하는 이유는 캡쳐를 하기 위해서 (capture semantics)
    }
    
    deinit {
        print("메모리가 해제됐습니다.")
    }
}

// 객체 대량 복사
var myStudent: Student? = Student()
var newStudent = myStudent
var newStudent3 = newStudent
var newStudent4 = newStudent3

// 객체1에게 값 할당 > 전체 값 변경됨
newStudent?.b = 30
myStudent?.b


// 지금은 클로저를 변수를 가르킬 수만 있도록 선언, ⭐️ 객체들이 먼저 nil일 경우 - 클로저도 메모리에 선언이 되지 않는다! 앞에 먼저 초기화를 해두어야 메모리 해제가 발생하지 않음
/// 클로저를 메모리에서 해제하기 위해서는 optional로 표기를 해야한다? > nil 값을 할당할 수 있어야 하니까 >> 그러네~
myStudent?.myClosure
myStudent?.myClosure = nil

// 객체들에게 nil 값을 할당해야 해당 클래스가 메모리에서 해제됨. 하나라도 빠지면 해제 X
myStudent = nil
newStudent = nil
newStudent3 = nil
newStudent4 = nil


// ⭐️ 클로저가 클래스 내부의 프로퍼티에 참조를 하고 있을 경우, 이 친구도 nil을 할당해야하는데,
//myStudent?.myClosure = nil
//myStudent?.myClosure      // 메모리를 참조하고 있다. capturing reference to data in myStudent > 그래서 이전과 다르게 메모리 해제가 되지 않고 있ㄸ


// 참조 중인 데이터를 끊어야지만 메모리에서 완전히 해제가 된다. > give the data nil >> 참조하고 있는 모든 instance에게 nil 값을 할당하니까 메모리 해제 완료
/// 메모리는 만들어질 때 다 만들어지기 때문에 해제할 때도 모두 해제를 해야한다. 내부 클로저에 변수를 참조하고 있는 값이 있다면 해당 클로저로 인해 메모리 해제 불가능

//-> 안에서 본인을 참조할 수 있다. nil을 할당해야한다. 객체들을 없애기 위해서 메모리 해제를 하는 방법이 있듯이 클로저도 값을 없애야 메모리에서 없어진다!



//MARK: - 클로저 메모리 해제 방법 2 / 캡쳐리스트?

//매번 클로저에게 nil값을 할당으로 메모리 해제를 하는 방법은 어렵다! - 잊을 수도 있고 등등...
//참조가 아닌 value로써 복사해서 클로저가 값을 사용한다면 메모리에서 해제가 된다.

class SomeA {
    var value = 10
}

class Pen {
    var length = 5
//    var copyA = SomeA()

    lazy var penClosure = { [weak self] in     // 참조가 아닌 값 복사 - 다른 클래스를 참조하고 있더라도 아무 문제없이 해제 가능하네?
        print(self?.length ?? 0)                // 여기서 self?를 하는 이유는 약한 참조인점을 알리기 위해 사용하는 것
    }

    deinit {
        print("펜 메모리가 해제됐습니다.")
    }
}

var newPen: Pen? = Pen()
var secondPen = newPen
var thirdPen = secondPen

newPen?.penClosure      // 참조가 아닌 복사한 값이기 때문에 deinit이 된다.

newPen = nil
secondPen = nil
thirdPen = nil          // ⭐️ self로 참조를 하고 있으면 메모리 해제가 안된다 > 기존 myStudent.myClosure과 같은 현상이 일어나는 건데, 이럴 경우 self를 weak self로 바꾸면 참조하는 형태가 약하게 변해서 메모리 해제가 가능해진다. weak를 사용하려면 참조하고 있을 떄문 가능, weak b 같은건 없다는 점!                weak로 두게 되면 reference counting이 늘지 않는다.

*/

//MARK: - escaping closure

//func showString(completion: () -> Void) {
//    completion()
//}

//showString {
//    print("a")
//}

// 밖에서 실행하는 변수
var myClosureList = [() -> Void]()
var myClosureList2: [() -> Void] = []


func showString2(completion: @escaping () -> Void) {
    myClosureList.append(completion)
}


/// 위에 선언한 함수로 closure 담아보기
showString2 {
    print("aa")
}

showString2 {
    print("bb")
}

showString2 {
    print("cc")
}


// 3개의 클로저가 담긴 상황

/// 클로저 모음에서 처음만 실행하고 싶을 때

/// 클로저 모음에서 특정 클로저를 실행하고 싶을 때
//myClosureList[0]()

/// 클로저 모음 전체를 실행
myClosureList.forEach { completion in
    completion()
}


let sayHello = {(name: String) -> String in
//    print( "My name is \(name)")  >> 이 친구는 print이기 때문에 return String 타입이 아니다. -> Void여야지 가능
    return "\(name)"
}


//: [Next](@next)
