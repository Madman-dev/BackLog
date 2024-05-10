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
<br><br>
## 3. enumerated
### 👷🏻‍♂️ 문제 [[링크]](https://leetcode.com/problems/defanging-an-ip-address/description/)
해당 문제는 해결했지만, 나는 사용하지 않았던 메서드가 있어 적어본다.<br>
### 문제 정의
내가 풀 문제 방법이다.
"." 를 "[.]"로 바로 교체하고 새로운 String 값을 반환하도록 적용했다.

```swift
class Solution {
    func defangIPaddr(_ address: String) -> String {
        let newIp = address.replacingOccurrences(of: ".", with: "[.]")
        return newIp
    }
}
```

String에서는 이렇게 값을 직접 교체할 수 있는 메서드가 있다는 것을 기억해서 풀 수 있었는데,<br>
다른 개발자들은 어떻게 풀었을까 하면서 보다가 enumerated()를 마주했다.<br>문제 풀이는 아래와 같았다,
```swift
class Solution {
    func defangIPaddr(_ address: String) -> String {
        // 새로운 배열 생성
        var result = [String]()

        // 각 Character 값 확인해서 배열에 삽입(at back)
        for char in address {
            result.append(String(char))
        }

        // 결과 배열의 index, 값 형식으로 변환, 정리
        for (index, char) in result.enumerated() {
            if char == "." {
                // 해당 값을 index에서 제거
                result.remove(at: index)
                // 해당 위치에 대체 값 input
                result.insert("[.]", at: index)
            }
        }

        return result.joined()
    }
}
```
나름의 내용을 정리해보면서 따라 작성했는데, enumerated() 메서드가 어떤 역할을 하는지 몰랐다.<br>코드를 봤을 때 튜플 타입으로 변형해주면서 내부 값에 index를 지정할 수 있게 되는 것 같았는데, 공식 문서와 해외 블로그를 읽어보면서 약간 차이가 있다는 점을 깨닳았다.

### 해결 및 이해
위 코드는 배열인 String을 for문으로 돌리지 않고도 index값을 할당하는 것으로 보였지만,
**사실 이 방식이 올바른 방법이 아니라고 한다.** <br>**어디까지나 개인적으로 이해했을 때까지...*

공식문서의 일부를 작성해보면 아래와 같이 설명하고 있었다.<br>

    When you enumerate a collection, the integer part of each pair is a counter for the enumeration, but is not necessarily the index of the paired value. These counters can be used as indices only in instances of zero-based, integer-indexed collections, such as Array and ContiguousArray.
**쉽게 정리하면 enumerated()에서 제공하는 값은 index가 아닌 counter라고 한다.**<br>
시험 삼아 아래 코드를 작성해봤는데, 내가 생각했던대로 index 값을 반환하는거라면 분명히 out of index 문제가 났어야 했다.

```swift
var array: [Int] = [0,1,2,3,4,5]

for (i, value) in array.enumerated() {
    // index에 무작위 값을 더해봤다
    print("문제인가:", i+4)
}

// 어떤 값이 지워지는지 확인
array.remove(at: 1)
print(array)

// 출력 값은 0,2,3,4,5
```

위에 정리한대로 enumerated()에서 제공하는 페어의 값이 index였다면 for문에서 out of index 문제가 나야하지 않았을까?<br>지금 상태를 보면 i는 counter의 역할을 한다. 즉, 실제 '위치 값'이라기보다 그냥 페어해준 값이다.<br> 하지만 '페어'된 값이면서 0 based 값이기 때문에 index처럼 활용은 할 수 있어 보인다.