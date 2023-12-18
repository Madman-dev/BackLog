## 기술 면접 질문 정리
#### 🚨상시 정리 중🚨

1. 구조체(Struct)에 대해서 설명해주세요. 어떤 경우 사용하나요?

(Personal Thought)
- 구조체는 프로퍼티와 메서드를 하나의 형태로 묶을 수 있는, 데이터 캡슐화를 할 수 있는 타입이다.

깊게 보면 '값' 자체를 복사해 올 수 있는 value type(값 타입)으로
쉽게 보면 클래스에서 상속 기능이 빠진 타입이라 이해 할 수 있다!
덕분에 메모리 측면에서 효율성이 높아 Apple에서도 사용하기를 권장하는 타입이다.

앞서 서술한대로 구조체는 값 타입이다.
이 때문에 값 자체가 복사되어 새로운 객체를 생성하게 된다.
이는 개발할 때 중요하게 작용하는데, 개발자 모르게 값이 어디선가 바뀌어 모든 값 전체가 바뀔 수 있는 참조 타입 (class)과 다르게, 구조체는 객체 하나의 값만 바뀌게 되어 어떻게 보면 기존 값을 유지하게 되는 장점이 존재한다.

커피를 활용해 참조와 값 타입의 차이점을 아주 간단하게 설명해본다면...
참조 타입은 사람은 여럿인데, 커피는 한 잔인 셈. 빨대 갯수에 따라 내가 한 모금만 마신다하더라도 누군가 마신다면, 결국 커피의 양은 줄어들게 된다.
즉, 내가 어디에서 코드를 바꾸던, 원본 값을 가지고 있는 객체의 값을 바꾸게 된다는 점

**반대로 값 타입은 사람 머릿수에 맞게 커피를 하나씩 쥐어주는 격이다.**
남이 커피를 몇 모금을 마시던지 상관없이 내가 가지고 있는 커피(객체)의 값은 내가 직접 마시지 않는 이상 바뀌지 않는다.

그렇기에 구조체는 **데이터 모델링** 할 때 자주 활용했다.
1. 데이터의 구조 및 구성은 어플이 구동된 이후, 바뀔 가능성은 극히 낮다 판단.
2. 데이터는 갯수를 판단할 수 없지만 한 개 이상의 데이터가 만들어질테니 최대한 메모리 효율성을 갖고 가고자 함.

2. 구조체(Struct)의 mutating 키워드에 대해서 설명해주세요. 
3. iOS 앱의 생명주기 이벤트(앱 시작, 백그라운드 이동 등)를 이해하고 처리하는 방법은 무엇인가요?
4. 뷰 컨트롤러 사이를 전환하는 방법에 대해서 설명해주세요.
5. 프로퍼티 옵저버(Property Observer)에 대해서 설명해주세요. (didSet, willSet)
6. bound와 frame의 차이에 대해서 설명해주세요.
7. Codable 프로토콜을 사용하여 JSON 데이터를 Swift 객체로 어떻게 디코딩하나요?
8. Auto Layout에서 스택 뷰와 같은 컨테이너 뷰의 역할과 사용법은 무엇인가요? 
9. Grand Central Dispatch (GCD)와 Operation Queue의 차이점은 무엇인가요?
10. 탈출 클로저(escaping closure)에 대해 설명해주세요.

11. 옵셔널에 대해 설명해주세요
12. 확장에 대해 설명해주세요
13. iOS에서 뷰(view)와 레이어(layer)의 개념과 차이점에 대해 설명해보세요
14. prepareForReuse에 대해서 설명하시오.
15. 구조체(Struct)와 클래스(Class)의 차이에 대해서 설명해주세요 (메모리적 관점) 
16. UIViewController 간 데이터 전달 방법 중 하나에 대해서 설명해주세요. (Delegate Pattern, Closure, NotificationCenter 등)
17. App의 Not running, Inactive, Active, Background, Suspended에 대해 설명해주세요.
18. 스토리보드를 이용했을때의 장단점을 설명해주세요.
19. ARC(ARC: Automatic Reference Counting)에 대해 설명해주세요.

20. Reactive Programming이 무엇인가요?
21. 클래스(Class)에 대해서 설명해주세요. 어떤 경우 사용하나요?
22. 프로토콜(Protocol)에 대해서 설명해주세요. 어떤 경우 사용하나요?
23. 테이블 뷰에서 데이터를 표시하고 데이터 원본과 델리게이트 메서드를 사용하는 방법을 설명해주세요.
24. hugging과 resistance에 대해서 설명해주세요.
25. 앱의 라이프 사이클(App Life Cycle)에 대해서 설명해주세요.
26. 뷰 컨트롤러의 라이프 사이클(ViewController Life Cycle)에 대해서 설명해주세요.
27. @Main이 무엇인가요? 
28. ARC란 무엇인가?
29. iOS 앱 내에서 메모리 관리를 최적화하기 위한 방법은 무엇인가요?
30. 고차함수(map, filter, reduce)에 대해서 설명해주세요.

31. 딕셔너리(Dictionary), 집합(Set), 배열(Array)에 대해서 설명해주세요.(각각의 특징과 차이점, 언제 어떤 자료구조를 사용하는게 좋은지)
32. left constraint와 leading constraint의 차이점에 대해서 설명해주세요.
33. 자신만의 Custom View를 만들려면 어떻게 해야하는지 설명하시오.
34. UINavigationController 의 역할이 무엇인지 설명해주세요.
35. shallow copy와 deep copy의 차이점을 설명해주세요.
36. 어떤 경우에 클래스(Class)보다 (Struct)를 사용하는 것이 좋을까요?
37. Delegation 및 NotificationCenter를 사용하여 뷰 컨트롤러 간에 데이터를 어떻게 전달하나요?
38. 상태 변화에 따라 다른 동작을 처리하기 위한 App delegate 메소드들을 설명해주세요.
39. 참조에 대해서 설명해주세요. (strong, weak, unowned)
40. method swizzling이 무엇이고, 어떨 때 사용하나요?