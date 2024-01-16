//: [Previous](@previous)

import Foundation

let myName: String = {
    return "이동준"
}()

print(myName)


// 클로저 정의
let myRealName: (String) -> String = { (name: String) -> String in
    return "개발하는 \(name), 도전 중!"
}

myRealName("밭뚜렁")

let myRealNameLogic: (String) -> Void = { (name: String) in
    print("\(name)은 개발자가 될 수 있을 것인지 귀추가 주목된다.")
}
myRealNameLogic("홀롤롤")



// 함수를 선언을 하고
func doSomething(closure: () -> ()) {
    closure()
}

// 함수에 들어가는 클로저로 실행하고
doSomething(closure: { () -> () in
    print("Hi")
})

// 동일한 클로저
doSomething{ () -> () in
    print("와썹")
}

// 이것도
doSomething { print("Man") }


//Additional
func doSomethingWeird() -> () -> () {
    return { () -> () in
        print("HELLO SEOUL")
    }
}

let testing = doSomethingWeird()
testing()


let jack = { () -> () in
    print("이동준이 대세")
}

jack()

//
//({ () -> () in
//    print("이렇게 하는걸까")
//})()


func something(closure: () -> ()) {
    closure()
}

something(closure: {() -> () in
    print("내가 아는건가")
})


something{ () -> () in
    print("이렇게 바꾸는 건가?")
}


func fetchData(success:() -> (), fail:() -> ()) {
//    do something
}

fetchData(success: {() -> () in
    print("이렇게")
}, fail: { () -> () in
    print("저렇게")
})

// 이걸 trailing Closure을 사용하면 > 마지막 클로저만 축약이 가능하다!
fetchData(success: {() -> () in
    print("다시 작성")
}) { () -> () in
    print("호이호이")
}

fetchData(success: {() -> () in
    print("도전")
}) { print("다시 한번?")
}


//MARK: - 클로저 경량화

func addData(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}

// 클로저 실행
addData(closure: { (a: Int, b: Int, c: Int) -> Int in
    return a + b + c
})

// 축약 1번 테스트 -> parameter 타입과 리턴 제외 가능
addData(closure: {(a, b, c) in
    return a + b + c
})

// 축약 2번 테스트 -> shorthand arugment names
addData(closure: { return $0 + $1 + $2 })

// 축약 3번 테스트 -> 단일 리턴은 return 키워드도 제거
addData() { $0 + $1 + $2 }

addData(closure: {  // 함수와 이름을 다르게 설정하면 해당 함수로 돌아가서 실행할 코드가 없어지는거구나~
    $0 + $1 + $2
})

addData {$0 + $1 + $2}

//MARK: - 트레일링 클로저

addData() { $0 + $1 + $2 }
// '()'는 아무 값이 없다면 생략 가능
addData { $0 + $1 + $2 }



func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) {
    let result = operation(a, b)
    print("이렇게 뽑아냈다. \(result)")
}

performOperation(4, 5) { (a,b) in
    return (a * a) + (b * b)
}

// 별도 사용 방법
performOperation(4, 5) { (a,b) in (a * a) + (b * b) }
performOperation(4, 5) { ($0 * $0) + ($1 * $1) }


//MARK: - optional Closure

func calculate(by: Int) -> () -> Int {
    var total = 0
    
    let calculator: () -> Int = {
        total += by
        return total
    }
    return calculator
}

let add = calculate(by: 4)
add()
add()
let newAdd = calculate(by: 2)
newAdd()
newAdd()



//MARK: - 클로저

//클로저는 던져질 수 있는 함수를 의미한다.

struct Student {
    let name: String
    var testScore: Int
}

let students = [Student(name: "이동준", testScore: 50),
                Student(name: "최진훈", testScore: 60),
                Student(name: "홍다희", testScore: 70),
                Student(name: "채진우", testScore: 80),
                Student(name: "최진훈", testScore: 90)]


var topStudentFilter: (Student) -> Bool = { student in // 학생 필터가 하고자 하는 역할은 성적이 특정 점수보다 높은지 낮은지를 확인하기 위함 - 따라서 Boolean 값을 적어 넣는 것 ++ student는 내가 원하는 parameter 이름을 지정했을 뿐, 실제로는 다르게 작성해도 문제없다.
    return student.testScore > 40
}

// 비슷한 구조를 가진다 -> closure로 사용이 가능하다
func topStudentFilterF(student: Student) -> Bool {
    return student.testScore > 60
}


let topStudents = students.filter(topStudentFilterF) // 이 친구는 값을 담는 것

for topStudent in topStudents {
    print(topStudent.name) // 여기서 3분의 성함이 출력되는 것
}


// MARK: - 트레일링 클로저
let topStudent = students.filter { newStudent in // newStudent 란은 parameter 역할을 한다. 우리가 받아 들이는 타입으로 우선 정리가 되어 있는데, 이건 변경할 수 있음
    return newStudent.testScore > 60
}

//let studentRanking = topStudents.sorted(by: <#T##(Student, Student) throws -> Bool#>)
let studentRanking = topStudents.sorted { $0.testScore > $1.testScore }
/// sorted(by:)로 했기 때문에 넣어야 하는 값이 2개인걸로 보여지는 거구나!! 하나의 함수라고 생각하면 우리가 파라미터에 어떤 학생의 값을 비교할 것인지 넣어야하는 것과 동일하네!


// MARK: - 클로저를 사용하는 이유
// ⭐️ 우리가 클로저를 사용하는 근본적인 이유가 뭘까?
// 코드는 재사용성과 깔끔(naming, 코드 길이, 사용 키워드 등)하면 좋은 코드라고 한다. 클로저는 함수를 변수에 담을 수 있도록 만드는데, 왜 이게 좋냐면 언제 어디서든 해당 함수를 변수에 담아서 실행 시킬 수 있기 때문이다. 함수로 한 예시를 만들어보자

// 코드 길이는 줄이고 재사용성을 높여야 하다보니 지금처럼 함수 안에 직접적으로 값을 넣는 방식은 좋지 않다 -> 왜? (이건 enum의 경우인거 같아)
// 직접 작성하다가 오류가 나면? 오타가 있으면? 혹시나 중간에 빠트린 부분이 있으면?
// 클로저는 기이이이이이ㅣㄴ 함수를 계속 반복해서 쓰는 구성도 이해가 안될 뿐더러 함수명을 변경할 수 없다보니 다른 곳에서 적용하게 될 경우 복잡해진다는 점이 있다. 클로저는 변수 안에 함수를 넣을 수 있다보니


// MARK: - 클로저 맹들어보기 시도!
/// struct Buyer { // 너무 복잡한 구조로 이해를 해보려 했다! 다시!
//    var name: String
//    var money: Int
//    var selectedItem: [String: Int] = [:]
//    var items: [String: Int] = [:]
//}

//func purchaseGoods() {
//    for (food, price) in Buy {
//        items[food] = price     // 이렇게 변동할 수 있다! 오호~
//    }
//}

struct Goods {
    let name: String
    let price: Int
}

let groceries = [Goods(name: "치킨", price: 100),
                 Goods(name: "아이폰", price: 200),
                 Goods(name: "우동", price: 10),
                 Goods(name: "김치", price: 5),
                 Goods(name: "수박", price: 15),
                 Goods(name: "PSP", price: 50)]

/// 필터를 사용하기 위해서는 원래는...
var buyingLimit: (Goods) -> Bool = { goods in
    return goods.price > 60
}
let testPurchase = groceries.filter(buyingLimit)

/// 트레일링 클로저를 사용하면 한번에 코드 길이를 줄일 수도 있다!
var mustBuys = groceries.filter { $0.price > 60 }


// MARK: - escaping Closure
// being able to make the datas live how many long after the time a function has been called. This allows data to be thrown and used variously within the program.


//: [Next](@next)
