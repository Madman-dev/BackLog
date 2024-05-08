# Algorithm Problems

## 1. overflow
### 👷🏻‍♂️ 문제 [[LINK]](https://leetcode.com/problems/n-th-tribonacci-number/description/)
**n번째 피보나치 수 값을 1234567로 나눈 나머지를 리턴하는 값을 찾아야 하는 문제**<br>
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
### 문제 정의
    10단계 중 4 단계까지는 통과
    나머지 테스트 "signal: illegal instruction (core dumped)" 에러가 발생

위 코드로 알고리즘 문제를 풀다가 어떤 이유로 터지는 현상을 마주했다.<br>
계산 자체는 잘되고 있어 보였는데 어디서 문제가 발생하는지 모르고 있었다.<br>
동기의 도움으로 문제를 나름 정의할 수 있었는데, 확실하지 않지만 <u>**마지막 결과 값을 계산하는 과정에서 '너무 거대해진 값이 overflow문제를 이어지는게 아닐까'로 결론 지었다.**</u>

### 해결 방법
return 하기전에 나머지 값을 미리 계산하면 문제가 발생하지 않았다!
<br><br>
## 2. max()
### 👷🏻‍♂️ 문제 [[링크]](https://leetcode.com/problems/widest-vertical-area-between-two-points-containing-no-points/description/)
해당 문제에는 2가지 이슈가 발생하여 기록한다<br>
**1. 알고리즘 문제 자체를 이해하지 못함**<br>
**2. 문제 풀이에 사용된 메서드를 처음 봄**
### 문제 정의
1. 문제 자체를 제대로 이해하지 못해서 발생한 오해다.<br>
widest Vertical area containing no points라고 하는데,widest vertical area를 넓이가 아닌 높이 계산으로 착각을 했다.

2. 문제를 파악한 이후 간단한 for, if문으로 문제를 해결했는데, 다른 친구들은 어떻게 풀었을지 확인해보니 max()를 활용하고 있었다. 사용해본 적이 없는 메서드였는데, reduce 같은 형태로 작성이 되는 것 같았다.

```swift
class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let sorted = points.map { $0[0] }.sorted()
        var maxWidth: Int = 0

        for value in 1..<sorted.count {
            maxWidth = max(maxWidth, sorted[value] - sorted[value-1])
        }
        return maxWidth
    }
}
```

### 해결 방법
LEETCODE