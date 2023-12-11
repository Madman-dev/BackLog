## 구조체와 enum
### 🚨 구조체의 단점<br/>
흔히 enum은 switch문으로 case를 돌리거나 방대한 error Handling을 정렬할 때 사용했다.<br/>
enum이 제공하는 깔끔한 구조가 좋다 생각했지만 그 이상의 역할을 주거나 본 적이 없었는데, 이번 책을 읽으면서 색다른 enum 사용법을 보게 되어 기록한다.<br/>
*기록이라 하고 거의 복붙이라 쓸 수 있겠다*
<br/><br/>
초기 데이터 모델링은 대체로 구조체를 사용했다.
"메시지"를 모델링해본다면, 아래와 같이 구성했겠다.
```swift
struct Message {
let userId: String // 메시지 발송, 수신자
let contents: String? // 내용
let date: Date // 날짜
let hasRead: Bool // 읽었는지 여부
let hasJoined: Bool // 참여 여부
let hasLeft: Bool // 나가기 여부
}

let newMessage = Message(userId: "1", contents: "기존 메시지 생성 방식", date: Date(), hasRead: False, hasJoined: True, hasLeft: False)
```
<br/>

*개인적으로 구조체를 사용하던 이유는*
1. 특정 객체라 지정하며 관련 프로퍼티 / 메서드, 함수를 담아 **이해하기 쉽다 생각**
2. **애플에서 추천하는 방식** (memory-wise && simplicity)
3. **익숙**하게 사용하던 방식

세번째 이유가 가장 어이가 없지만, 사실이다.<br/>
그동안 강의나 영상, 여러 자료들을 보았을 때도 구조체를 사용했었다.<br/>
그러다보니 익숙해진 경향이 있고 손에 잘 익어 사용하는 편이었다.<br/>

하지만 Tjeerd 작가는 다른 방식을 추천했는데, 바로 enum을 사용하는 방식이었다.<br/>
여러 이유가 있었는데, 가장 먼저 구조체가 가지고 있는 문제점(?)이다.
<br/><br/>
____
구조체 / 클래스의 객체는 runtime에 생성된다.<br/>
우리가 특정 타입을 지정하고 IDE에서 머리를 굴려 짜겠지만, compile time에는 구성만 맞으면 문제가 없다.<br/>
단, Runtime이 되어서야 실체화되는데, 이 때 다양한 프로퍼티를 담고 있는 구조체/클래스의 객체들은 어떤 값을 담은 타입이 될지 확실할 수 없다고 한다.<br/>
- 위의 message 구조체를 보더라도 이미 담고 있는 프로퍼티들이 많다.<br/>
이 덕분에 message가 "명확히 하나의 값을 가진 메시지"로 구분이 안된다고 한다.<br/>
- 예를 들어 contents에 내용이 있다면 '메시지' 자체는 맞다. 단, hasRead, hasJoined도 true, false 값이 주어져야 할텐데,<br/>
이 중 하나만 값이 true라면 '내용이 있는 메세지'이면서 동시에 'Boolean state 값을 가진 메시지'로 2가지 타입의 형태를 띄게 된다고 한다. <br/>
<br/>

**위와 같은 방식은 구조체의 가장 큰 단점.**<br/>
runtime에 객체가 실체화 되는 구조체 특성상, 개발자는 단순히 내용이 있는 메시지로 생각할 수 있지만 - 사실 생성될 때까지 A값 또는 B값을 가진 메시지로 구분될지 **확실하게 말할 수 없다는 점**.<br/>
<br/>
### 🌱 enum의 장점<br/>

반대로 enum은 compile time에서 오류를 확인할 수 있기에 개발자 입장에서 명확하게 어떤 타입으로 생성하고자 의도할 수 있다고 한다.<br/>
위의 Message를 enum으로 생성하는 과정은 아래와 같았다.<br/>

```swift
enum Message {
case text(userId: String, contents: String, date: Date)
case read(userId: String, hasRead: Bool, date: Date)
case join(userId: String, hasJoined: Bool, date: Date)
case left(userId: String, hasLeft: Bool, date: Date)
}

let textMessage = Message.text(userId: "1", contents: "이렇게 메시지를 만들 수 있다?!", date: Date())
let leftMessage = Message.left(userId: "1", hasLeft: true, date: Date())
```

위에 생성된 객체와 구조체에서 생성된 객체의 차이점을 보게 되면 극명하게 드러난다.
구조체와 달리,
1. 명확한 "타입"을 가진 메시지다.
2. runtime에 어떤 값을 가진 객체로 구분될지 걱정하지 않아도 된다.

message이면서도 텍스트를 담고 있는 textMessage인지, 혹은 사용자가 떠났다는 알림을 담은 메시지인지 구분이 가능하다.

### 참고 코드
- [SwiftInDepth by Tjeerd in 't Veen](https://www.manning.com/books/swift-in-depth?a_aid=swiftindepth&a_bid=04b4fbb6)
