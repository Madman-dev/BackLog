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
<br/><br/>

# Async vs Closure

함수를 실행한 이후 해당 결과값을 전달하는 방법에서 Closure을 활용한 상황이 많았다.
Async Await도 활용은 해보았지만, 명확하게 어떤 차이점이 있는지 정리해보고자 한다.

### Async Await
Async는 비동기적으로 작업을 요청하고 해당 요청 결과물이 반환될 때까지 await(기다리는) 상황을 거친다.
Swift에서 await는 요청 사항을 캡쳐하고 async 요청 결과물이 반환될 때까지 추가 작업 혹은 실행을 멈추는 상황을 가진다.

동일한 방식으로 인접한 내용을 캡쳐하여 반환하는 값을 기다리는 상황은 escaping closure도 똑같다.

async가 붙어 있는 한, escaping closure을 활용할 수 있을 정도

