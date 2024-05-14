# 타이머 구현 이슈

> ## Hit Maximum timestamp count.

구현 이후 타임 스탬프가 maximumCount를 도달하여 이벤트를 더 이상 기록하지 않을 것이라는 오류가 발생

### 🥚 Breakdown
1. 최초 생성한 타이머는 문제없이 잘 진행되는 점을 확인
2. 정답을 맞추거나 틀리더라도 타이머 주기가 점점 짧아지는 문제점 확인

### 🐣 생각 정리
- 타이머 자체는 잘 구현이 되어 보인다.
오류에서 언급된대로 Queue에서 더이상 추가를 하지 않는 것 같다는 생각
- 타이머에 추가할 수 있는 한계가 존재하는건가? 계속해서 반복 돌리는 구조가 repeats 부분이랑 충돌이 나는건가?

```swift
func countDownTimer() {
    timer = Timer.scheduledTimer(timeInterval: timeLeft,
                                    target: self,
                                    selector: #selector(timeIsOver),
                                    userInfo: nil,
                                    repeats: false)
    
    addTimer(subLayer: timeShapeLayer, color: .green)
    addTimer(subLayer: timeLeftShapeLayer, color: .white)
    runTimer()
}
```

### 🐔 접근 시도
- 타이머가 너무 빨리 생성이되는게 아닐지 걱정됐다.
별도로 생성한 이후 runTimer() 하기 이전에 강제로 1초를 멈춰보았다.

실행했을 때 해결되어 보였는데, 정답을 맞출수록 문제가 다시 발생했다.

- 해당 [링크](https://stackoverflow.com/questions/53180804/why-does-my-timer-in-swift-keep-speeding-up)에 따르면 타이머 자체의 문제라고 한다.
이 설명이 맞다면 타이머가 RunLoop에서 돌면서 한번이 아닌 반복해서 호출을 한다고 하는데, 나의 경우 
1. 새로운 pokemon을 받을 때
2. 타이머가 종료되었을 때
2가지 단계에서 countDownTimer()를 호출하고 있었다.

두 번 혹은 그 이상으로 호출이 되면서 Timer 객체가 하나가 아닌 여러개가 만들어지게 되고 이 과정으로 인해 Timer의 속도가 배로 빨라지는 것 같다.

애초에 타이머를 생성할 때의 문제점이였을 뿐, 문제를 맞추고 틀리는 것과는 별개다!