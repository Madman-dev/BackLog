## Transition이란 무엇일까?
앱 같은 경우 화면의 상황이 가장 중요하다.
하나의 화면에서 여러 개의 활동을 보여줄 수 있어야 하는데 그러기 위해서는 ViewController에서 뷰를 바꿀 수 있어야 하는데
이를 화면 전환, transition을 통해 이뤄낼 수 있다.

화면 전환에 있어 다양한 방법들이 있는데,
간단하게 먼저 정리를 해보고자 한다!

### Push & Pop
기본적으로 iOS 어플에서 버튼을 클릭했을 때 화면1에서 화면2로 전환하기 위해서는 navigation Controller/ stack을 필요로 한다.
Navigation stack은 첫 화면(root view)을 선정하는 것과 비슷한데, 어플이 실행되었을 때 최초 화면이라고 볼 수 있겠다.
해당 화면 위로 다음 화면들을 쌓아 올리거나 없애는 행위를 반복해야하는데, 해당 navigation stack이 있다면 push와 pop을 사용할 수 있게 된다.

push는 현재 화면에 다음 화면을 밀어 올리는 행위
pop은 현재 화면을 stack에서 밀어 없애는 행위로 설명할 수 있는데,
push는 왼쪽에서 오른쪽으로 - pop은 오른쪽에서 왼쪽으로 화면이 이동한다!


### 참고
- https://developer.apple.com/documentation/swiftui/navigationstack
- https://medium.com/@ashutos39/default-transition-animations-in-ios-swift-757ff8ab844f