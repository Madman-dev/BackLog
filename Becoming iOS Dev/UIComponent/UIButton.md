# UIButton

그동안 너무 쉽다고 생각했던 버튼도 사실은 엄청난 존재라는 것을 느끼며... 공부하는 내용을 조금이나마 적어본다

### Before Anything...
UIAction은 기존 menu를 위해 추가된 기능에서 iOS 14에서 Button, Slider, Textfield 등에 확장 적용된 기능으로 보인다.
*menu에서 발생할 수 있는 다양한 탭과 이벤트를 위해 디자인되어 있는만큼 적용하는 범위 관련해서는 논의가 필요한 상황이라고 한다.
UIAction 자체를 활용할 수는 있으나 명확하게 처리했으면 하는 특정 UIControl이 있다면 addAction 방식이 옳은 접근일 것이라고 넌지시 말한다.
더불어 UIAction을 활용하기로 했다면 발생할 수 있는 싸이클 또한 고려해야 한다는 점~

### 버튼 선언 및 활용 (Objective-c)
그동안 프로젝트에서 버튼은 아래와 같은 형식으로 짰다.
*당시 가독성을 위해 then 프레임워크를 적용했었다.
let loginButton = UIButton().then {
    $0.setTitle("로그인", for: .normal)
    $0.backgroundColor = ColorGuide.main.withAlphaComponent(0.5)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    $0.layer.cornerRadius = 10
    $0.clipsToBounds = true
    $0.isEnabled = true
}

private func addButtonActions() {
    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
}

당시에는 디자인 패턴을 따라 만들겠다고 View와 VC를 구분하는 형식으로 코드를 짰는데...
나름의 낭비(?)였다는 것은 이후에 알게 됐다...

아무튼!
보통 저렇게 선언을 했다.
캠프에 참여했던 대부분의 친구들도 저렇게 선언했던 걸 보면, 익숙한 방식을 따라 갔지 않았을까 싶다.
하지만 WWDC21을 보면서 iOS13부터 적용 범위가 넓어진 UIAction을 활용하는 코드가 계속 보이는 점이 걸렸다.

addTarget는 왜 더이상 사용하지 않는걸까?

## Removing Objective-c
iOS13 UIKit에서 소개된 UIAction은 이벤트 핸들링을 더 쉽게 만들기 위해 활용된다고 한다.
아쉽게도 당시에는 UIAction을 UIMenu에서만 적용하는 방식을 채택했다고 한다.
하지만 이어 iOS14부터는 UIControl, BarbuttonItem 등 UIAction API 범위를 넓혔는데,
UIControl는 action만 인자로 받아들여 생성되는 코드가 존재한다.

```swift
// initializer method of UIControl
public convenience init(frame: CGRect, primaryAction: UIAction?)

해당 UIControl는 UIButton, UITextfield, UISwitch 등 다양한 UIComponent에서 상속받고 있다.
따라서! 해당 컴포넌트들에서도 적용이 가능하다고~

let createFolderButton = UIButton(primaryAction: UIAction(title: "", handler: { action in
    print("create folder 버튼이 눌렸습니다.)
})}
createFolderButton.setImage(UIImage(systemName: "folder.badge.plus), for: .normal)
```

블로그에서는 action이 여러가지일 경우, 코드 가독성이 떨어지기 때문에 callback 로직이 한 줄로 정리가 가능할 경우에만 UIAction을 활용하고 아닐 경우 self, target 방식을 따르는게 좋다고 제안한다.

## But then Why use UIAction?
가장 중요한 건 Swift 답지 않다고 한다.
결국 addTarget를 하는 방식은 오랜 Objective-c / cocoa 방식을 활용한 것이기 때문에 스토리보드를 활용해서 버튼을 생성하거나 코드베이스로 버튼을 생성하거나
결국 버튼의 Action을 실질적으로 이루는 메서드는 @objc buttonTapped()로 귀결된다는 점.

이 방식이 틀린 점은 아니나, Swift에서 바라보는 방향과 매우 다르다는 점인 것 같다.
Archaic(EXTREMELY old-fashioned)라고 하는 것을 보면 정말 싫어하는 듯한 느낌을 알 수 있다;;;
하지만 이 현상은 코드를 봐도 오래된 방식이라는 것을 알 수 있는데, addTarget(self, action: #selector(buttonTapped()))인 부분만 보면
#selector의 역할은 단지 버튼이 눌렸을 때 해야하는 행동을 연결 지어줄 뿐인 점을 알 수 있게 된다.

버튼을 구성하기 위해 버튼을 선언, 버튼 동작을 따로 처리해야한다는 점이 가장 큰 불편함이겠다.
이전부터 클로저를 선언하여 내부적으로 처리할 수 있는 방식을 여러 서드 파티 프레임워크는 제공했다고 한다.
여기서도 문제점은 해당 메서드, 함수를 control가 기억하거나 저장할 수 있도록 하는 작업이었는데, Swift에서 공식적인 방법을 제공했다는 점이다.

____

아래가 Apple에서 제공하는 UIAction 활용 방법 중 하나다.
UIAction을 함수를 감싸는 wrapper처럼 활용하는 방식이라고 한다.
*wrapper..? 무슨 뜻일까?

<br/>
아무튼! 아래와 같이 활용할 수 있게 된다. (발견한 많은 방법 중 하나)

```swift
let newButton = NewButton()

func configureNew() {
    newButton.addAction(for: .touchUpInside) { [weak self] action in
        let alert = UIAlertController(title: "이렇게?", message: "알람이?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self?.present(alert, animated: true)
    }
        
    view.addSubview(newButton)
        
    NSLayoutConstraint.activate([
    newButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    newButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
}
```


```swift
let startButton = UIButton(primaryButton: UIAction { [activity] _ in
    activity.start()
})

startButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
startButton.setTitle("start", for: .normal)
view.addSubview(startButton)
```

위처럼 self를 사용하지 않고 event handling을 처리할 수 있다는 점은 강력하다.
하지만 UIAction은 단순히 self - target을 클로저로 대체하는 방식을 넘어 더 많은 것을 제공한다.
UIAction을 통해 프로퍼티를 직접 변경할 수 있게 된다!

```swift
let startAction = UIAction(title: "Start", image: UIImage(systemName: "play.circle.fill"), handler: { [activity] _ in activity.start()})

let startButton = UIButton(primaryAction: startAction)
view.addSubview(startButton)
```

이외에도 UIAction은 UITextfield와 활용이 가능하다고~
*이것저것 해보면서 궁금해지는 부분은 나는 일반적으로 addTarget을 코드베이스 상단에 선언된 컴포넌트에 하는 방식에 조금 익숙해졌다.
하지만 UIAction을 통해서 컴포넌트를 선언하는 경우 대부분은 선언하는 위치에서 버튼의 action까지 한번에 처리하도록 하는 방식은 과연 가독성 및 좋은 의미로 받아들일 수 있을지 궁금해진다.*


++ 예시들을 보거나 활용해보려고 해도 여전히 애매하게 보여진다.
WWDC에서도 생명주기 메서드 내에서 선언하여 활용하는 방법을 보여준 것 같았는데, 개인적으로 더 복잡해지지 않을까? 하는 생각이다.
더불어 메서드 내부에 각각 컴포넌트를 선언하면 활용을 할 수 있겠지만, 파일 별 코드가 길어지거나 복잡해질 경우, 1. 변경을 하기 어려워지거나 2. 변경해야할 프로퍼티를 쉽게 찾을 수 없을 것 같다는 생각이 든다. 더불어 3. 동료 개발자들이 해당 코드를 쉽게 읽을 수 있을지 언정, 빠르게 찾을 수 있을까??? 고민이 든다.

참고:
- https://pratiksodha.medium.com/uiaction-eb167aa54b7
- https://developer.apple.com/videos/play/wwdc2020/10052/
- https://www.biteinteractive.com/control-target-and-action-in-ios-14/
- https://www.iosdevie.blog/p/goodbye-target-actions-hello-uiactions