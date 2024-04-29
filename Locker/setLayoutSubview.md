# setLayoutSubview()
해당 메서드는 뷰의 bound 값이 변하거나 view가 다른 view에 담기거나 할 때 자동으로 호출되는 메서드이다.
setNeedsLayout() 이후에 호출되는 메서드로, view에 더해진 subView들의 레이아웃을 바로잡아야 한다고 외치는 것과 동일하다.

landscape, portrait 등 어떠한 상황으로 view가 새로 그려지는 경우에 호출되어 **반복 호출될 수도 있다**. 퍼포먼스 향상을 위해 고려해야할 메서드.
<br/><br/>
___
<br/>

> ## 생성 시점에 cornerRadius 적용

커스텀 UIImageView, UIView 등 특정 용도로 사용하는 컴포넌트의 경우, 생성하는 시점에 별도 메서드 호출없이 cornerRadius를 주면 좋을 것 같다 생각했다. 이미 layoutSubview를 적용했었지만, 반복적으로 호출하고 있다는 점에서 문제가 있을 것 같아 다양한 방법을 시도해보았다.

### 🥚 Breakdown
생성하는 시점부터 rounded하게 만들자!

### 🐣 생각 정리
1. init에서 메서드를 호출하면 안되나?
2. layoutSubviewIfNeeded()?

## 🐔 접근 시도

### init에서 메서드 호출
내가 자주 문제를 겪는 포인트가 시점인 것 같다. (그렇다고 한다.)

UIImageView가 생성되는 시점이라 생각한 init에서 호출한 메서드는 제대로 불리지 않았다. 분명히 print()에 담긴 메시지는 잘 전달이 되었지만, 적용이 되지 않는 걸 니 init 시점에 대한 이해도가 아직 낮다고 생각된다.

### override layoutSubviews()
```swift
override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = self.bounds.width/2
}
```
위 코드는 원하던 모습을 그대로 구현했다.
하지만 해당 메서드는 반복적으로 호출되는 것으로 이해하고 있었는데, 정확했다.
공식문서에서도 오토레이아웃 또는 constraint 관련된 작업이 바라던대로 적용되지 않았다면 사용하라고 정리를 해두었다. 종종 사용하던 방식이었지만 여러모로 찜찜한 마음에 방식을 바꿨다.

### didSet bounds
```swift
override var bounds: CGRect {
    didSet {
        layer.cornerRadius = bounds.width/2
    }
}
```
지금까지 생각들은 모두 Trade-off가 있었다.
해당 커스텀 UIImageView는 **무조건** circular한 모양을 가지게 된다는 점.
다른 용도로 사용할 수 없다는 점을 감안하고 생각하고 시도해본 방법들인데, 확장성 및 만일 다른 개발자들의 참여가 있었다면 오히려 헷갈릴 수 있는 결과물을 만들어낼 수 있었겠다 싶다.