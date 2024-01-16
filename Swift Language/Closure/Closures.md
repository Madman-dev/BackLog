# Closure

클로저는 1급 객체를 의미한다.
1급 객체인만큼 변수에 담겨 값으로 던져질 수 있으며 하나의 함수로 작동할 수 있다.
클로저 내부는 argument Label이 없고 넣을수도 없다.


클로저는 다양한 형태를 가지는데, 이를 통해 축약된 형태로 만들 수 있게 된다.

```swift
func add2(_ i: Int, _ j: Int, _ handler: (Int) -> Void) {
    let sum = i + j
    handler(sum)    // handler는 Int를 받는 return이 return type이 Void인 함수
}

add2(3, 4, { (result: Int) -> Void in
    print("3 + 4 = \(result)")
})

// 축약
add2(3, 4, { result in
    print("3 + 4 = \(result)")
})

add2(3, 4) { result in
    print("3 + 4 = \(result)")
}
```

