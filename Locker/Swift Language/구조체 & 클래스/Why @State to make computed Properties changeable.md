## Using @State to change computed properties

- 연산 프로퍼티는 현재 값에서 다른 값으로 변환이나 환산을 해줄 수 있음에도 불구하고 @State를 활용해야만 computed Property를 바꿀 수 있다.
왜 그런걸까?

```swift
struct Mac {
    var model: String
    var inches: Int
    
    var myModel: String {
        "\(model) \(inches)"
    }
}

let myMac = Mac(model: "M1 macbook", inches: 14)
print(myMac.myModel)
```

여기서 myModel이 연산 프로퍼티이다.
연산 프로퍼티는 Read-Only인 성질을 가진다.
myModel의 값은 model과 inches의 값에 따라 반환되는 값이 결정되기에 별도로 myModel의 값을 set할 수 없다.

struct는 값을 저장하는 value type이기에 프로퍼티를 변경할 경우 새로운 객체를 생성시킨 다음, 초기 객체를 교체해야 한다.
하지만 객체가 let으로 선언되어 있을 경우, 값 변경이 불가능해진다.
따라서 프로퍼티가 var로 선언되어 있다고 하더라도 객체가 var 또는 let으로 선언되어 있는지에 따라 프로퍼티를 변경할 수 있게 된다.

SwiftUI에서는 body가 연산 프로퍼티

참고
- https://www.hackingwithswift.com/forums/100-days-of-swiftui/question-why-do-we-need-atstate-to-make-var-computed-properties-changeable-while-it-is-designed-to-be-dynamic/11086