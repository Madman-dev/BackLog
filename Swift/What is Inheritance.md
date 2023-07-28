## 상속(Inheritance)
인간은 죽으면 이름을 남기고, 동물이 죽으면 가죽을 남긴다고 한다.<br/>
코드도 비슷하게 구현할 수 있는데, 상속을 통해서 가능하다.<br/> 부모 클래스(parent/super class)는 자신의 모든 재산(property와 method)을 자식(child/sub class)에게 물려줄 수 있다.<br/>

```swift
class Person {
    var name: String
    var age: Int
    var personality: String

    init(name: String, age: Int, personality: String) {
        self.name = name
        self.age = age
        self.personality = personality
    }

    func growOld() {
        print(한살 더 먹었습니다.)
        self.age += 1
    }

    func walk() {
        print("사람이 걸어갑니다")
    }
}

class Student: Person { // 추상화의 프로토콜과 마찬가지로 여기에서 상속을 시킨다.
    let studentId: Int
    var isStudying: Bool

    init(name: String, age: Int, personality: String, studentId: Int, isStudying:Bool) {
        self.studentId = studentId
        self.isStudying = isStudying
        super.init(name: name, age: age, personality: personality)
    }

    override func walk(){   // override 키워드를 통해 상속 받은 메서드를 활용하면서 실행 코드를 변경할 수 있다.
        print("학교로 등교합니다")
    }
}
let jack = Person(name: "Jack", age: 1, personality: "INFP")
let newStudent = Student(name: "student", age: 19, personality: "ENFP", studentId: 12345, isStudying: true)

jack.growOld()
jack.walk()
// 한살 더 먹었습니다.
// 사람이 걸어갑니다.

newStudent.growOld()
newStudent.walk()
// 한살 더 먹었습니다. → 자식 클래스는 선언하지 않아도 부모 클래스의 메서드 그대로 사용 가능하다.
// 학교로 등교합니다.
```
간단하게 보면 위에 Student 클래스는 이름, 나이, 성격은 따로 프로퍼티를 선언하지 않았다.<br/>그럼에도 '상속'을 통해 부모 클래스인 Person이 가지고 있던 프로퍼티를 물려 받아 사용할 수 있게 된다는 점이다.
<br/><br/>
## 상속이 왜 필요할까?
(프로토콜 제외) 상속을 개발자들은 왜 쓸까?<br/>상속의 목적은 반복되는 코드 (repetition)을 줄이기 위해 만들어졌다.
이미 선언된 클래스에서 필요한 프로퍼티와 메서드를 가지고 있는데, 코드를 굳이 다시 작성해야하는 이유가 뭘까?<br/> 이 배경에서 inheritance라는 기능이 탄생했다.

```swift
enum Species {
    case bird
    case dog
    case cat
    ...
}

class Dog {
    var name: String
    var species: Species
    var isFull: Bool
    var canBark: Bool
}

class Cat {
    var name: String
    var species: Species
    var isFull: Bool
    var hasWhiskers: Bool
}

class Bird {
    var name: String
    var species: Species
    var isFull: Bool
    var canFly: Bool
}
```
위 코드가 최적의 예시는 아니지만 대략적으로 설명을 한다.<br/>강아지, 고양이, 새가 존재하는데 - 일부 비슷한 코드가 보인다.<br/>
이 반복되는 코드를 하나의 최상의 클래스를 만들어 코드 반복성을 없애는 거다. 

```swift
enum Species {
    case bird
    case dog
    case cat
    ...
}

class Animal {
    var name: String
    var species: Species
    var isFull: Bool
}

class Dog: Animal {
    var canBark: Bool
}

class Cat: Animal {
    var hasWhiskers: Bool
}

class Bird: Animal {
    var canFly: Bool
}
```

## 그렇다면 상속은 좋은 기능일까?
### 코드가 간소화 됐다!
코드를 다시 안 써도 된다니! 정말 좋은 기능이다.<br/>~~하지만 수많은 개발자 사이에서 상속은 그렇게 좋은 기능으로 인정받지 않는 기분이다.~~ 하지만, 개발자 사이에서 잘못 활용되는 경우가 많다고 한다.<br/> 상속을 활용할 때는 고려해야하는 문제점들이 좀 있는데, 간단하게 내 생각을 정리하면 -
1. 단일 상속 - 상속의 범위가 넓어질수록 발생하는 문제점
2. 자식 클래스를 부모 클래스 파라미터에 활용 가능
3. 상속의 개념 자체가 'OOP'에서 벗어난다

앞서 두 가지의 내용은 개인적으로 활용해보면서 느낀 경험들이었다.
하지만 세 번째 의견이 있어 더한다.
글의 저자는 상속은 OOP의 개념에서 완전히 벗어어나는 기능이라고 한다. 물론 반복되는 코드를 작성하지 않아도 된다는 점에서 편리성은 인정하지만, '상속'이 가지는 의미가 부여되기에는 어렵다고 한다. 상식적으로 우리는 무언가를 '상속'받기 위해서는 부모님께서 돌아가셔야 한다. 하지만 코드 상에서 상속은 **부모 클래스의 프로퍼티와 메서드를 복사해서 가져올 뿐, 부모 클래스의 객체가 없어져야만(deinit) 값을 상속받는다는 점이 아니라고 짚는다.**

아직 스스로 알아봐야 하겠지만, 상속은 간편해보이면서도 복잡하다.


### 참고
- https://softwareengineering.stackexchange.com/questions/260343/why-is-inheritance-generally-viewed-as-a-bad-thing-by-oop-proponents
- https://www.yegor256.com/2016/09/13/inheritance-is-procedural.html

