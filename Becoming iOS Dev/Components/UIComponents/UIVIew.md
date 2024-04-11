# UIView
- 스마트폰에서 유저가 마주하는 화면 자체를 의미하는데, 스크린 속에 담긴 객체들을 관리하는 또 다른 객체이다.
- 어플의 UI를 그리는데 가장 기본적으로 사용하는 타입으로 사각 범위 내에 담기는 UIComponent 혹은 값들을 렌더링할 수 있고 사용자의 입력에 대응을 할 수 있다.

## 책임 (Responsibilities)
- UIView가 사용자의 입력을 대응할 수 있기에 가장 많은 역할을 가지고 있다.
1. _Drawing & Animation_
- UIKit와 Core Graphic을 활용해서 화면을 그린다.
2. _Layout & subview_
- 스마트폰의 **메인 화면**으로 이해하면 쉽다. 하나의 View 객체에 다양한 UIComponent, content를 올리는 역학을 하기에 subView를 진행한다. 그렇기에 하나의 view 객체에서 다양한 view의 관리를 담당한다.
- 별도로 관리 뿐만 아니라 크기 조정도 담당한다. (autoLayout)

3. _EventHandling_
- 사용자의 입력(인풋)에 대한 대응과 반응도 진행한다.


___

앞서 이야기한대로 하나의 view 객체에서 다양한 view를 담을 수 있게 되는데, 이렇게 되며 view hierarchy를 구축할 수 있게 된다. 연관 콘텐츠끼리 일종의 연결고리를 지을 수 있게 되는데 - 이를 통해 view는 다른 객체들과 child - parent 관계를 가지게 된다.

___

## setNeedsLayout()
-  view에 subview되어 있는 모든 view를 한번에 업데이트를 할 수 있도록 호출하는 메서드로 이해된다.<br/> 하나의 특징은 **예약** 형식이라는 점인데, UI를 데이터 변화에 따라 바로 업데이트하는 구조가 아니라 view가 그려진 이후 약간의 텀이 있는 이후 다시 그려질 때 해당 메서드가 호출되어 화면이 변하게 된다. (자세한 내용은 화면이 그려지는 과정을 보자.)

- 가장 큰 장점은 예약 형식으로 진행이 되기에 모든 UI가 한번에 업데이트 된다는 점이다.
(This allows you to consolidate all of your layout updates to one update cycle, which is usually better for performance)

#### Q.
지금까지 이해하기로 화면을 한번에 재구성할 경우 호출하기 좋은 메서드로 보인다.
언제 이 메서드를 호출하게 될까?
지금 떠오르는 과정들은 대부분 interaction에 대해 빠르게 대응하는 구조밖에 떠오르지 않는다... update 시점에 맞춰 모든 layout이 바뀌는 형식은...

## setNeedsDisplay()


### 참고<br/>
- [공식문서](https://developer.apple.com/documentation/uikit/uiview)
- [WhenToUseLayout](https://stackoverflow.com/questions/50406332/the-occasion-to-call-setneedslayout-or-setneeddisplay)