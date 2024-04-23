# 230713 타입 프로퍼티(Type Property)
<br/>

## TIL(Today I Learned)
### 학습내용
오늘은 야곰을 복습하던 도중, 완벽하게 이해하지 않고 있던 Type Property에 대해서 찾아봤다.<br/>
Property에는 Stored, Computed가 존재하는 것은 알고 있지만, Type Property는 4주차까지 언급을 하지 않았다보니 여전히 미스테리인 키워드였다.
<br/><br/>
## 세부 내용 + 코드 활용
먼저 이해해야하는 건 Instance Property이다.<br/>
일반적으로 Class, Struct 내부에 선언하는 값들은 Instance Property로 칭한다.<br/>
Instance Property라고 부르는 이유는 객체를 우리가 해당 클래스나 구조체에서 만들어내면 객체로 복사되기 때문에 instance property라고 부르게 되는 건데, Type은 왜 존재하는걸까? 라는 고민을 했다. <br/>
<br/>
이유는 간단했다!<br/>
Class, Struct에 객체들이 접근할 수 없는 값을 제공하기 위해. 간단한 코드가 있어 따라 해봤다.

```Swift
class Player {
    static var totalNumberOfPlayer = 0
    var name: String
    
    init(name: String) {
        Player.totalNumberOfPlayer += 1
        self.name = name
    }
    
    static func printTotalNumberOfPlayer() {
        print("Total Number of Player is \(Player.totalNumberOfPlayer)")
    }
    
    class func printGameName() {
        print("Road Runner")
    }
}

let jack = Player(name: "Jack")
let steve = Player(name: "Steve")

class Enemy: Player {
    override class func printGameName() {
        print("Super Mario")
    }
}
```
공식문서에 작성되어 있던 코드인데, 여기서 봐야할 포인트는 이전과 달리 property 앞에 static과 class가 달렸다는 점이었다.<br/>
둘 다 Type Property를 만드는데, class는 클래스 타입의 상속 (child class)들에게 클래스에서 가지고 있는 Type Property를 수정(override)할 수 있게 돕는 키워드이다. 반면 static은 클래스와 구조체에게 Type Property를 선언해주는 키워드였다.<br/><br/>

위 코드에서 보이다시피, static을 사용한 property들은 아래에서 초기화한 객체들, jack과 steve에서 호출이 불가능하다.<br/>
Dot Syntax로 접근을 하려고 해도 아무것도 안보인다는 점!<br/>

객체에서 보이지도 않는데 왜 필요할까? 하는 생각이 들었지만 - 위에 예시에서는 ***Player 클래스에서 만들어내는 객체의 수를 확인할 수 있도록 구성을 했다.*** static var totalNumberOfPlayer로 객체들은 접근할 수 없는 타입 프로퍼티를 만들고, 객체를 실체화하는 init 과정에서 자기 자신의 타입 프로퍼티를 1 올렸다. 이렇게 되면 Player라는 클래스에서 가지는 고유한 값을 통해 객체가 메모리에서 사라졌는지, 아직 존재하는지 등 일종의 property observer 역할을 할 수 있지 않을까 하는 생각도 들었다. <br/>
여전히 모르는 부분은 많지만, 지속적으로 찾아 나가보자!

#### 참고
- https://babbab2.tistory.com/120#recentEntries
- https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/
