## Transition이란?

앱 같은 경우 화면의 상황이 가장 중요하다.
하나의 화면에서 여러 개의 활동을 보여줄 수 있어야 하는데
그러기 위해서는 ViewController에서 뷰를 바꿀 수 있어야 한다.
이를 화면 전환, transition을 통해 이뤄낼 수 있다!

화면 전환에 있어 다양한 방법들이 있는데, 간단하게 먼저 정리를 해보고자 한다.

### 1. Navigation Controller (Push & Pop)
가장 흔하게 사용하는 방식은 navigation Controller이 있다.

최초 화면을 설정하는 것과 동일한 것으로 이해할 수 있다.
RootViewController를 지정하게 되면 해당 화면 위로 다음 화면들을 쌓아 올리거나 없애는 행위를 반복하게 되는데, 이는 navigation Controller의 특성이다.
Navigation Controller에 존재하는 navigation Controller object은 정렬된 배열 (orderd Array)형식으로 하위 viewController들을 관리한다.

해당 navigation Controller에서는 특정 행동 시 (버튼 탭 등), 새로운 viewController가 이전 viewController 위로 쌓일 수 있도록 만들게 되는 것이다.
이 행위를 Push 와 Pop이라 부르는데, push는 새로운 viewController이 stack에 쌓아 올려질 때를 의미하며 이때 화면 전환은 오른쪽에서 왼쪽으로 새 화면이 쌓아 올려진다.
Pop는 viewController가 화면에서 내려지고 아래에 존재하는 viewController로 돌아가는 형태를 의미하는데, 이때 화면은 오른쪽으로 밀려나가면서 화면 전환이 마무리 된다.
*이해해야 되는 점은 이전 화면 자체에 올려지는 것이 아니라 한번은 실행된 (instantiated) 화면을 보관하고 있는 navigation Stack에 올려지는 것이다*

* 최초 설정한 rootViewController은 navigation controller stack에서 사라지지 않기 때문에 push / pop이 불가능하다.
더불어 navigation Controller을 사용하면 앞서 설명한대로 viewController들이 쌓아 올려지는데, hierarchy를 보게되면 겹겹이 쌓인 viewController를 볼 수 있다.


### 2. Navigation Controller (perform segue)
Segue(세그웨이)는 navigation Controller와 동일한 느낌으로 화면 전환을 이룬다.
차이점이 있다면 코드가 아닌 스토리보드로 화면을 구성할 때 사용할 수 있는 방법이다.
스토리보드에선 시각적으로 화면이 어디와 연결되어 있는지 확인할 수 있다. 이 상황에서 특정 행동으로 화면1에서 화면2로 전환될 수 있도록 설정하는 것이 segue이다.

세그웨이에는 독특한 점이 존재하는데, segue 객체는 화면과 화면 사이 전달할 정보 또는 데이터를 담고 있다고 한다.
다만, 개발자는 이 객체를 직접 생성할 수 있는 것이 아니라 스토리보드가 런타임에서 어떤 데이터를 담을지 실행한다고 한다.
이 데이터 바구니는 2 단계를 걸쳐 화면1에서 화면2로 넘어가게 되는데 prepareSegue와 performSegue 메서드를 활용해서 가능해진다.

PrepareSegue는 두번째 viewController에게 화면 전환이 있을 것이라고 안내를 하는 것이다.
이 화면 전환에 있어 어떤 데이터가 넘어갈지 정할 수 있게 된다.
추가적으로 알고 있어야 하는 점은 prepareSegue는 performSegue이 실행되기 바로 직전에 실행된다는 점

```swift
class ViewController: UIViewController {
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if firstTextField.text == "" || secondTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력해야합니다"
            mainLabel.textColor = UIColor.red
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = UIColor.black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmiNumber = self.bmi
            secondVC.bmiColor = colorAdvice()
            secondVC.bmiAdvice = getBmiAdvice()
        }
        
        firstTextField.text = ""
        secondTextField.text = ""
    }
}
```

정리한대로라면 위 코드에서 prepare 메서드는 performSegue 메서드가 불리기 전에 실행될 것이다.
segue가 가지고 있는 idetifier를 확인하고 일치할 경우 viewController에 있는 데이터 중 bmiColor, bmiAdvice, bmi 데이터를 secondVC로 넘길 것을 약속한다.
이후 shouldPerform을 통해 다시 한번 조건을 확인하고 특정 UIComponent에 연결된 segue가 실행되면서 데이터를 넘기고 화면 전환이 이뤄질 것이다.

### 3. present
Present는 앞서 push/pop 그리고 perform Segue를 하는 방식과는 달리 코드로 특정 viewController를 등장시킬 때 사용이 된다.
몇가지 특징이 있는데, Present는 modal presentation 형식이기에 화면이 전체를 채우지 않는다.
*단, modalPresentationStyle을 바꾸면 full Screen이 가능해진다.

이유는 말그대로 modally viewController이 등장하기 때문인데, 존재하는 viewController *위에* 등장하는 점이 특징이다.
present로 새 화면을 띄우게 될 경우, 아래에서 위로만 화면 전환이 이루어지는데, navigationController / stack 위에 해당 화면이 쌓이도록 하는 방식이 아니다.
**그렇기에 navigationBar이 존재하지 않는다!**


### 참고
- https://developer.apple.com/documentation/uikit/uinavigationcontroller
- https://medium.com/@ashutos39/default-transition-animations-in-ios-swift-757ff8ab844f
- https://developer.apple.com/documentation/uikit/uistoryboardsegue
- https://developer.apple.com/documentation/uikit/uiviewcontroller/1621490-prepare
- https://stackoverflow.com/questions/31877312/difference-between-perform-segue-with-identifier-and-prepare-for-segue
- https://developer.apple.com/documentation/uikit/uiviewcontroller/1621380-present
- https://github.com/russell-archer/ModalStylesDemo