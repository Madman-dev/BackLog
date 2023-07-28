## 추상화(Abstraction)<br/>
OOP에서 중요하게 다루는 추상화,
추상화는 복잡한 과정과 작업을 숨겨, 특정 행동을 할 경우, 의도했던 결과만 볼 수 있도록 만드는 과정을 의미한다. 쉽게 말하면 불필요한 것을 지우고 핵심을 남겨둔다는 점은 추상화의 기본이다.

조금 더 간단한 예시를 들어 보자. <br/>커피를 내려 마시고 싶어 커피 머신의 버튼을 눌렀을 때,<br/> 소비자가 기대하는 것을 커피일뿐, 자세한 내용은 모른다.<br/> 커피 머신이 어떻게 작동하고, 어떤 과정을 거치는지는 '커피 내리기'라는 추상적인 작업 안에서 발생하게 된다.

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
위 예시에서 '추상화' 작업을 CoffeeMachine 프로토콜에서 정리를 해준다.<br/> 어떤 기기에서 어떤 작업을 하고 등등을 파악할 필요 없이, CoffeeMachine 프로토콜을 채택한 contract를 채결한 커피 머신 클래스가 있다면 brewCoffee() 기능을 실행할 수 있게 된다.

<br/>

### 상속과 프로토콜 == 추상화인걸까?
---
프로토콜을 활용해서 '추상화'를 이뤘다는 점에서 들었던 생각이다.
contract를 체결시켜 결국 동작 원리보다 동작하는 인터페이스 하나만 외부에 보여준다는 점에서 표면적으로 비슷해보이는 원리를 가진 상속과 프로토콜은 추상화를 의미하는지 궁금해졌다.

> 결론만 말하자면 상속과 추상화는 완전히 다른 영역이지만 프로토콜은 추상화를 구현하는 기본적인 베이스로 이해된다.


**Abstraction은 코드를 변형적이고 재사용하기 쉽게 활용하는 컨셉이다.**
프로토콜과 상속이 어쩌면 추상화를 이룰 수 있다고 생각할 수 있지만,
'추상화다'라고 보기에는 어렵다.

<br/>

### 개발자는 코드에 왜 추상화를 적용 해야할까?
---
추상화는 복잡한 과정을 보여주지 않는다.
운전을 하기 위해 핸들과 브레이크, 악셀의 위치를 알고 어떤 '동작'을 하는지 아는게 중요하지, 어떤 원리로 작동하는지를 꼭 알아야지만 운전을 할 수 있는건 아니다.

이처럼 추상화는 개발자에게 다양한 장점을 제공해 준다.
간단하게 찾아봤을 때,
1. 넘쳐나는 정보를 제한해준다.<br/>개발자에게 너무 많은 정보를 제공할 경우, 이해하는데 시간이 더 오래 걸리며 읽기 복잡해진다는 의견이 있다.
2. 코드별로 각자 맡은 임무와 역할만 잘 수행할 수 있도록<br/> (This prevents the need to understand every code, but the concept of what chunks of codes do when trying to reuse code)

<br/><br/>

참고
- https://steady-coding.tistory.com/453
- https://singhdivesh.medium.com/interface-and-abstraction-in-swift5-e62adb1bcfaf
- https://pediaa.com/what-is-the-difference-between-abstraction-and-inheritance/#Abstraction%20vs%20Inheritance%20-Comparison%20of%20key%20differences
- https://www.youtube.com/watch?v=Ui7Dca5Kbvw
- https://www.quora.com/Why-do-you-need-abstraction
- https://stackify.com/oop-concept-abstraction/