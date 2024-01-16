## 캡슐화(Encapsulation)<br/>
여전히 어려운 부분이지만, 내가 느끼기로는 여기저기 흩어진 데이터를 각자 맡은 역할 및 책임에 맞게 가두면서 '특정 데이터를 감추기 위해' 사용하는 컨셉이다.<br/> 간단하게 생각해보자. 내가 로또를 사서 당첨 된다면 얼마를 받는지,<br/> 이름은 뭔지, 어디에 사는지 등을 알리거나 보여주고 싶을까? <br/>**코드도 마찬가지다.**<br/>
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
다소 엉뚱할 수 있지만, 위처럼 한 클래스의 객체가 다른 클래스의 객체들이 어떤 값을 가질지 모르도록 하는 행위가 encapsulation의 기본이다.<br/> 
코드에서는 내가 책임지는 정보(프로퍼티)와 기능(메서드)에 다른 객체들이 접근할 수 없도록 만들어야 한다.<br/>그래야만 의도치 않은 외부 행동으로 값이 무작위로 바뀌지 않으며,<br/> 위 예시처럼 person1이라는 객체가 자신이 아닌 다른 클래스의 객체 값을 확인할 수 없게 되는 것이다.
<br/><br/> 

## 왜 캡슐화를 사용하는걸까?<br/>

다시 정리하면, 캡슐화는 내가 가진 프로퍼티와 메서드 등을 다른 객체 혹은 코드에서 접근할 수 없도록 가둔다는 컨셉이다.<br/> 코드를 가두는 대신, 원하는 결과물을 만들어 낼 수 있도록 일종의 인터페이스를 만든다. 필수인 메서드만 남겨두고 데이터를 제한하는 것이다!<br/> 단, 모든 데이터의 접근을 제어하기보다, 필요한 정보는 공유(messaging) 하거나 받을 수 있도록 일부만 감춰두는데, 이 행위를 은닉화라 부른다.<br/>*private 키워드를 활용하여 메서드 혹은 프로퍼티를 숨긴다.*

돌아가서,<br/>
굳이 왜 우리는 코드의 존재를 숨겨야 할까??<br/>
앞서 간단하게 정리했지만 프로그램 내에서 의도치 않은 값 변경이 발생하지 않도록 하기 위함이다.
<br/> '값이 바뀐다'는 무엇을 의미할까?<br/> 우리가 의도했던 결과를 벗어나는 수많은 에러 가능성을 의미한다.<br/> 혹여나 nil이라는 값이 만들어질 경우, 프로그램은 자동으로 종료가 될 것이다.<br/>
### 이래도 캡슐화를 안 쓸 생각인가!

### 참고
- https://www.sumologic.com/glossary/encapsulation/#:~:text=Encapsulation%20is%20a%20way%20to,an%20instantiated%20class%20or%20object.
- https://didu-story.tistory.com/320