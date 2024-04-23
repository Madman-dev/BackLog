## 다형성(Polymorphism)이란 무엇일까?
### poly + Morph<br/>
형태를 다양하게 변할 수 있음을 의미하는 다형성은 상속을 통해 가장 쉽게 설명할 수 있다.<br/>
이전 상속 내용에서 작성했던 예시를 다시 한번 활용해보겠다.
<br/><br/>
```swift
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func walk() {
        print("\(name)이 허허벌판을 걷는다.")
    }
}

class Student: Person {
    var isStudying: Bool

    init(name: String, age: Int, isStudying: Bool) {
        self.isStudying = isStudying
        super.init(name: name, age: age)
    }

    override func walk() {
        print("\(name)이 학교로 등교하고 있습니다.")
    }
}

class Employee: Person {
    var hasJob: Bool

    init(name: String, age: Int, hasJob: Bool) {
        self.hasJob = hasJob
        super.init(name: String, age: Int)
    }

    override func walk() {
        print("\(name)이 피곤한 몸을 이끌고 회사로 출근하고 있습니다.")
    }
}
```
위의 예시를 보면 3종류의 클래스가 작성됐다.<br/>하지만 두 클래스는 Person이라는 클래스를 상속받아 있는 상황이다.<br/>이 말은, Student과 Employee는 학생과 직장인 타입이면서 사람 타입이라는 것이다.<br/>
<br/> 이전에 값을 '상속'받는 모습으로 설명을 했지만, 사실 위 코드는 코드의 다형성을 보여주는 모습이기도 하다.<br/>Student와 Employee이면서 Person 타입이라는 점. 코드가 가진 여러 모습을 의미한다. 조금 쉽게 보여주자면...

```swift
var adam = Person(name: "adam", age: 10)
var highschooler = Student(name: "student", age: 19, isStudying: true)
var developer = Employee(name: "IOS developer", age: 30, hasJob: true)

var everyPeople: [Person] = [adam, highschooler, developer]
```

각 클래스별로 객체를 생성했다.<br/>생성된 객체들은 하나의 배열에 모아두도록 했는데, 배열의 타입을 보면 [Person]이다. 타입이 A이면서도 B이기에 다양한 코드에서 사용이 가능하기에 코드의 다양하게(poly) 변할 수 있는(morph) 모습을 의미한다.

## 다형성은 중요한걸까?
잘만 하면 코드를 상황에 맞게, 다양하게 사용할 수 있어 보인다<br/>
좋아 보이지만, 다형성은 좋은 특징일까? 만약 좋다면 왜 좋고, 나쁘다면 왜 안 좋을까?<br/>



### 참고
- https://www.hackingwithswift.com/read/0/20/polymorphism-and-typecasting
- https://levelup.gitconnected.com/polymorphism-in-swift-b03def92fa26