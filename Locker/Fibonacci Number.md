# Algorithm

### overflow 현상
알고리즘 문제를 풀다가 어떤 이유로 코드가 터지는 현상을 마주했다.
계산은 잘되고 있는 것 같은데, 어디서 문제가 발생할까 라는 고민을 하고 있었는데, 동기의 도움으로 문제를 해결할 수 있었다. **확실한 결론은 아니지만 결과값을 다시한번 계산하는 과정에서 너무 거대해진 값이 overflow문제를 발생하고 있는게 아닐까라는 결론을 지었다.**

### 문제
n번째 피보나치 수 값을 1234567로 나눈 나머지를 리턴하는 값을 찾아야 했다.

```swift
func solution(_ n:Int) -> Int {
    
    guard n > 1 else { return 0 }
    guard n > 2 else { return 1 }
    
    var prev1: Int = 0
    var prev2: Int = 1
    
    for _ in 2...n {
        let sum = prev1 + prev2
        prev1 = prev2
        prev2 = sum
    }
    return prev2%1234567 // 여기서 코드가 터지는 것 같다. 
}
```

위 코드로 10단계 중 4 단계까지 통과, 나머지는 "signal: illegal instruction (core dumped)" 에러가 발생.
최종 값에서 나머지 값을 구하는 형식을 담다 보니 결과값이 완전히 계산되지 않는 상황이 아닐까 싶다.

