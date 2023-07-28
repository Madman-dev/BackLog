# 230726 OOP는 좋은 프로그래밍 방식일까?
매우 얕은 공부를 하며 OOP에 대한 생각을 정리하고 업데이트 해보고자 한다!

## TIGO(Today I Go Over)
### OOP는 무엇일까?

Object-Oriented Programming의 줄임말로, 객체 지향 프로그래밍이라고 불린다. Alan Kay라는 사람이 만들었다시피 불리는 이 프로그래밍 패러다임/방식은 완벽하게 분리된 서로 다른 객체들이 정보 교환(메시징)을 통해 임무를 완성 시킨다.<br/><br/> 간단 예시를 들면, 사람이 자판기에서 커피를 뽑아내려고 한다고 가정하자.
커피를 뽑기 위해 사람은 ❶ 지갑을 꺼내 돈을 확인하고 ❷ 자판기 금액을 확인하고 ❸ 알맞는 금액을 자판기에 넣어 원하는 음료를 선택할 것이다. 이때 자판기는 ❹ 받은 돈이 음료 금액과 크거나 같은지 확인하고 ❺ 음료를 사람이 받을 수 있도록 출구로 보낼 것이다.
<br/><br/>**이 상황만으로 OOP가 설명됐다!**<br/>
여기서 사람과 자판기는 Object(객체)다.<br/>
객체들은 서로 무엇을 가지고 있는지는 모른다. (디스플레이처럼 보여주는 무언가가 있지 않는 이상)<br/>사람은 본인이 가진 돈을 확인하고 금액만 넣었을 뿐, 실제로 커피를 만드는 행동은 자판기에서 한다. 이게 바로 객체 지향 프로그래밍이 지향하는 방향이다. 사람은 '커피'라는 결과물만을 원할 뿐, 자판기가 어떻게 만드는지는 신경을  쓰지 않는다.<br/>
<br/>


<details close>
<summary>OOP를 OOP로 구분 짓는 키워드들</summary>
📝 plan to update anytime - In Case I've left any out <br/><br/>
<details close>
<summary>캡슐화(Encapsulation)</summary>
- 여전히 어려운 부분이지만, 내가 느끼기로는 '정보를 감추기 위해 사용한다.'<br/> 간단하게 생각해보자. 내가 로또를 사서 당첨 된다면 얼마를 받는지,<br/> 이름은 뭔지, 어디에 사는지 등을 알리거나 보여주고 싶을까? <br/>코드도 마찬가지다.<br/><br/>

```swift
class LottoWinner {
    private let name: String
    private var currentBalance: Int
    private var home: String

    init() // 생략
}

class People {
    private let name: String
    private var currentBalance: Int

    init() // 생략

    func searchMoney() {
        // LottoWinner.currentBalance → 이런 접근을 불가능하게 만든다!
        print("\(currentBalance)")
    }
}

let jack = LottoWinner(name: "Jack", currentBalance: 1_000_000_000, home: "Seoul")
let person1 = People(name: "person1", currentBalance: 1_000)

jack.currentBlanace // 1_000_000_000
person1.searchMoney() // jack도 person1도 '자신이 가진 값만' 확인이 가능하다.
```
다소 엉뚱할 수 있지만, private 키워드를 통해 접근을 제한하는 법이 encapsulation의 기본이다.<br/> 
코드에서는 내가 책임지는 정보(프로퍼티)와 기능(메서드)를 다른 객체들이 접근할 수 없도록 만들어야 한다. <br/>그렇게 해야지만, 위 예시처럼 다른 클래스에서 생성된 person1이라는 객체가<br/>LottoWinner 클래스의 객체인 사람의 돈을 확인할 수 없게 되는 것이다.
<br/> 캡슐화를 통해 은닉화 라는 특징을 활용하게 된다.
</details>

<details close>
<summary>추상화(Abstraction)</summary>
소비자 입장에서 추상화는 복잡한 과정과 작업을 숨기고 특정 행동 시, 의도했던 결과만 볼 수 있도록 하는 것이다.
더 쉽게 말해 - 커피를 내려 마시고 싶어 커피 머신의 버튼을 눌렀을 때, 소비자가 기대하는 것을 커피일뿐, 자세한 내용은 모른다. 커피 머신이 어떻게 작동하고, 어떤 과정을 거치는지는 '커피 내리기'라는 추상적인 작업 안에서 발생하게 된다.

```swift
protocol CoffeeMachine { // 추상화를 하는 CoffeeMachine 프로토콜
    func brewCoffee()
}

class EsspressoMachine: CoffeeMachine {
    func brewCoffee() {
        print("에스프레소가 추출됩니다.")
    }
}

class LatteMachine: CoffeeMachine {
    func brewCoffee() {
        print("라떼가 추출됩니다.")
        addCream()
    }

    private func addCream() {
        print("위에 크림을 더합니다")
    }
}

func makeCoffee(using machine: CoffeeMachine) {
    machine.brewCoffee()
}

let 에스프레소커피 = EspressoMachine()
let 라떼커피 = LatteMachine()

makeCoffee(using: 에스프레소커피)
// 에스프레소가 추출됩니다.
makeCoffee(using: 라떼커피)
// 라떼가 추출됩니다.
// 위에 크림을 더합니다.
```
위 예시에서 '추상화' 작업을 CoffeeMachine 프로토콜에서 정리를 해준다.<br/> 어떤 기기에서 어떤 작업을 하고 등등을 파악할 필요 없이, CoffeeMachine 프로토콜을 채택한,<br/> contract를 채결한 커피 머신 클래스가 있다면 brewCoffee() 기능을 실행할 수 있다는 것을 알 수 있다. 

</details>
<details close>
<summary>상속(Inheritance)</summary>
인간은 죽으면 이름을 남기고, 동물이 죽으면 가죽을 남긴다고 한다.<br/>
코드도 비슷한 느낌으로 부모 클래스(parent/super class)는 자신의 모든 재산(property와 method)을 자식(child/sub class)에게 물려줄 수 있다.<br/><br/>

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
간단하게 보면 위에 Student 클래스는 이름, 나이, 성격은 따로 프로퍼티를 선언하지 않았다.
그럼에도 '상속'을 통해 부모 클래스인 Person이 가지고 있던 프로퍼티를 물려 받아 사용할 수 있게 된다는 점이다.

가장 중요하게 생각해야할 점은 Swift는 단일 상속을 원칙으로 내세운다는 점인데, 이때문에 제약이 생각보다 많으며<br/> 코드가 오히려 복잡해지는 경향이 있다는 점이 있다.

</details>
다형성<br/>

</details>

### 그래서 OOP가 좋은걸까?
이미 OOP는 여러 프로그램에서 이미 그의 시선을 따르고 있다.<br/>Java, Python, C++ 등은 이 패러다임을 일부 채택해서 따라가고 있다고 하는데, OOP가 어떤 점에서 좋고 왜 따르는지 궁금해졌다.
<br/>

코딩은 구현, 효율성 등등 챙겨야할 게 많은 것 같다.<br/>
하지만 다양한 패러다임들이 등장한 이유는 **지저분한 코드** 때문에 나타난게 아닐까 싶다. Spaghetti code라고 부르는 현상을 방지하고 벗어나고자 프로토콜 지향적, 객체 지향적, 함수형 등등 다양한 관점에서 좋다고 생각되는 프로그래밍 방식이 등장한 것으로 이해하고 있는데, OOP는 책임과 담당 역할에 따라 분리가 된다는 점에서 좋게 판단되는 프로그래밍 방식이 아닐까 싶다.

더불어서 궁극적인 목표 중 하나가 결국 코드를 줄여 반복되는 repetition을 없애기 위한게 아닐까?

### 그렇다고 OOP가 좋은건 아니다!
개인적으로 느끼는 것도 개발을 처음하는 입장에서 '실세계를 구현한 듯한 프로그래밍 방식'이라고 해서 이론적인 접근이 가깝게 다가왔을 뿐이지, 실제로 코드를 짜보면 물음표를 많이 던지게 된다.

클래스가 제공하는 상속만 바라봐도 애매해지는 경우가 많다.<br/>
단일 상속만 지원하는 클래스에 굳이 상속이라는 기능이 왜 필요한 걸까. 작성해야하는 코드를 줄여 주기는 하지만, 상속을 활용하고자 할 때, 혹은 갑자기 추가를 해야할 때, Parent Class가 지녀야하는 프로퍼티와 메서드에 대한 고민이 정말 많아져야 한다는 생각을 한다.