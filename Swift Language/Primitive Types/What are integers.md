# What is an Integer?
## TIGO(Today I Go Over)
### Integer는 무엇을 의미할까?

Integer는 정수를 의미한다! 우리가 흔히 사용하는 숫자(소수점을 제외한 대부분의 모든 숫자)라고 생각하면 쉬울 듯하다.<br/>
정확히 말하면 **0을 포함하는 자연수**를 정수라 부르는데, **음수의 값**도 포함된다.<br/>

Swift에서 정수를 다양한 형식으로 제공하는데, 8, 16, 32 그리고 64비트 형식을 지원한다.<br/>
64 > 32 > 16 > 8 순으로 표현 가능한 정수의 범위가 다르며 최대 9,223,372,036,854,775,807까지 표현이 가능하다.(OMG)<br/> UInt 타입 또한 존재하는데, Int와 달리 UInt는 Unsigned Integer이라 칭하며 ***음수의 값을 담지 못한다***

한가지 독특한 점은 일반적으로 Int는 위와 같이 In32, Int8와 같이 지정하지 않는 편이다.<br/>
사용하는 기기, 플랫폼에 따라 자동적으로 타입을 따라간다고 한다.<br/>
따라서, Swift 문법을 사용하며, Xcode에서 특정 범위를 지정하지 않을 것이라면 Int를 활용하면 의도하고자 하는 대부분의 값은 담을 수 있다. <br/><br/>

### in-depth
1. **random(in:)**<br/>
해당 표현으로 랜덤으로 값을 추출할 수 있다.<br/>
특정 범위를 지정하여 값을 뽑아내고 싶다면 유용하게 사용 가능해보인다.

    ```swift
    let myPick = random(in: 1...100)
    print(myPick)
    // prints random number from 1 ~ 100
    ```

2. **Integers have operators**<br/>
subtraction에서부터 multiplication까지 다양한 범위의 데이터 operator가 존재
작동하는 원리를 읽어보면 operator 우측에 있는 값을 활용하여 결과값(representation of the value)을 bit width로 계산한 뒤,<br/>
왼쪽에 위치한 변수, 데이터에 보관을 한다고 한다.

```swift
static func &>>= (inout Int, Int)
```

#### 참고
- https://developer.apple.com/documentation/swift/int