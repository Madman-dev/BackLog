# What are Macro(s)?

WWDC23에서 Macro라는 표현이 등장했다.
간단하게 이해하면 반복되는 코드를 없애거나 줄여주는 일종의 기술로 보여지지만, 조금 더 알아가기 위해 파본다.

- Swift 5.9부터 추가된 기능
- Cambridge Dictionary에 따르면 Macro는 'A single Instruction given to a computer that produces a set of instructions for the computer to perform a particular piece of work'라고 한다. [[링크]](https://dictionary.cambridge.org/ko/%EC%82%AC%EC%A0%84/%EC%98%81%EC%96%B4/macro)
- Wikipedia에는 'rule or pattern that specifies how a certain input should be mapped to a replacement output.'이라고 설명을 한다. [[링크]](https://en.wikipedia.org/wiki/Macro_(computer_science))


여전히 이해가 안되지만, Swift Macros는 프로젝트 컴파일 과정에서 코드를 생성하고 즉각적으로 제공을 한다고 한다.
- 필요한 코드를 새로 작성한다. 하지만 삭제 또는 변경하지는 않는다. (Expanding a macro is always an additive operation)

macro가 추가 코드를 구현하기는 하지만, 항상 개발자 눈에 보이도록 한다는 점은 아니라고 한ㄷ.
해당 코드에 대한 정보가 필요하다면 Xcode는 자율적으로 expand, 또는 collapse 할 수 있도록 제공한다고 한다.


### 왜 도입이 되었을까?
- 깔끔한 코드를 유지, 코드 줄을 줄이고 적용시 다양한 기능을 제공한다...가 끝?

### Macro 작동 방법
Swift에는 2가지 Macro가 존재한다.
1. Freestanding Macros
2. Attached Macros

들어가기 전, 서로 부르는 이름이 조금 다르지만 둘 다 macro 확장의 개념이며 호출하는 방식도 같다.

### Freestanding Macros
- 이름 앞에 (#)이 온다고 한다.
```swift
func warnOthers() {
  print("지금 마을이 위험하다. \(#function)")
  #warning("마을이 위험합니다")
}
```

#function과 #warning이 여기서 macro 기능을 하는데, 
#function처럼 특정 값을 제공하거나 #warning처럼 compile 시점에서 오류 등을 나타낼 수 있다.


### Attached Macros
- 이름 앞에 (@)를 붙인다.
- 붙은 선언문에 macro 코드를 추가할 수 있게 되는 점!

```swift
struct SundaeToppings: OptionSet {
  let rawValue: Int
  static let nuts = SundaeToppings(rawValue: 1 << 0)
  static let cherry = SundaeToppings(rawValue: 1 << 1)
  static let fudge = SundaeToppings(rawValue: 1 << 2)
}

// 위 코드는 생성 시점 (init)을 통해 값을 일일이 주고 있지만 불필요하다. + 오타를 낼 수 있는 상황이기에 아래처럼 macros를 적용해서 바꿀 수 있다.

@OptionSet<Int> // << 이 부분이 macros
struct SundaeToppings {
  private enum Options: Int {
    case nuts
    case cherry
    case fudge
  }
}
```
이처럼 코드가 간소화 되면서 읽기 불편한 점을 Swift가 처리해주는데, 세부적으로 보면 macros는 아래처럼 작동한다고 한다.

```swift
struct SundaeTopping {
  private enum Options: Int {
    case nuts
    case cherry
    case fudge
  }

  typealias RawValue = Int
  var rawValue: RawValue
  init() { self.rawValue = 0 }
  init(rawValue: RawValue) { self.rawValue = rawValue }

  static let nuts: Self = Self(rawValue: 1 << Options.nuts.rawValue)
  static let cherry: Self = Self(rawValue: 1 << Options.cherry.rawValue)
  static let fudge: Self = Self(rawValue: 1 << Options.fudge.rawValue)
}

extension SundaeTopping: OptionSet {}
```

macros가 큰 도움을 주고 있다 느껴지는가?

참고
- https://engineering.traderepublic.com/get-ready-for-swift-macros-fe21d3867e02