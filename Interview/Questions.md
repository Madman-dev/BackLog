## 기술 면접 질문 정리
#### 🚨상시 정리 중🚨

### 1. 구조체(Struct)에 대해서 설명해주세요. 어떤 경우 사용하나요?

(답변)

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

### 2. 구조체(Struct)의 mutating 키워드에 대해서 설명해주세요.

(답변)

(Personal Thought)
- mutating은 구조체가 품고 있는 메서드 앞에 사용할 수 있는 키워드다.
핵심은 해당 메서드를 통해 구조체가 갖고있는 프로퍼티의 값이 바꾸거나 바꾸고자 한다면 - mutating을 활용해야 한다.

해당 키워드를 사용하는 이유는 값 타입이기 때문이다.
한가지 이해해야하는 부분은 프로퍼티가 변수로 선언되어 있다면 애초에 구조체 내 메서드 호출로 프로퍼티 값을 변경할 수 있다.
그럼에도 불구하고 mutating을 활용하는 이유는...

1. 개발자에게 프로퍼티가 변할 수 있는 특정 메서드가 있다는 점을 알리기 위해
2. Compile Time에 있어 특정 프로퍼티의 값이 변경될 것이라는 점을 compiler에게 알려 - safety를 유지하기 위해
3. 값 타입의 경우, 클래스와 달리 서로 '고유의 값'을 가진다. 따라서 객체1과 객체2는 서로 다른 객체라고 볼 수 있는데, 이 구조체가 가지는 '고유성'을 유지하고 의도했던 위치에서만 값이 바뀌는 것을 쉽게 확인할 수 있도록 활용하는 것으로 이해한다.
     
### 3. iOS 앱의 생명주기 이벤트(앱 시작, 백그라운드 이동 등)를 이해하고 처리하는 방법은 무엇인가요?

(답변)

(Personal Thought)

[자세한 내용은 [추가 참고](https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app)]

**어플 상태**
들어가기 앞서 앱에서는 생명주기를 알려주는 상태(state)라는 것이 존재한다.
아래와 같이 5가지 상태로 구분된다.

1. Not Running: 어플이 눌리지 않은 상황으로 어떠한 event를 받거나 notification이 실행되지 않는다
2. Active: 어플이 실행되는 과정으로 event를 받아드릴 수 있는 상황이다.
3. Inactive: 어플이 실행되고 있는 상황이지만 event를 받아드릴 수 없는 상황이다.
아주 잠깐 실행되는 단계로 이해되는데, 예를 들어 어플을 하고 있는 도중 전화가 오는 상황이다.
지금 실행 중인 어플의 event input가 잠시 중단되고 사용자 집중은 전화로 넘어간다.
Having the user NOT ACTIVELY engaging with our app = Inactive State
4. Background: 어플이 배경에서 열심히 돌아가고 있는 상황이다.
어플이 종료된 상황이 아닌, 현재 화면에서는 보이지 않지만 코드를 실행하고 있거나 역할을 수행 중인 상황를 Background라 칭한다.
Q. 스포티파이 노래를 틀어놓고 다른 어플을 실행하는 과정도 Background라 볼 수 있나?
5. Suspended: 어플이 background 상태에 들어갔지만 코드를 실행하지 않는 단계이다.
해당 상황에 들어간 어플은 메모리에 존재하고는 있지만 **멈춘 단계**이며 곧 종료될 예정이거나 not running 단계로 들어갈 예정이다.

위 상태들이 생명 주기를 이해하는데 큰 도움이 된다!

**iOS12 이전**
어플에 전반적인 행동을 관리하는 메서드들이 모여 있는 프로토콜 UIApplicationDelegate를 채택한 appDelegate파일에서 앱의 생명주기가 처리된다.
iOS 12까지는 어플의 생명주기 더불어 모든 화면(window)의 생명주기 또한 appDelegate에서 처리가 되었다.
*iOS13부터 multi-window 개념이 도입되면서 appDelegate 하나만으로는 비효율적이라 생각했는지, sceneDelegate와 역할을 분담하기 시작했다.*

scene을 지원하지 않은 어플 - 모든 생명 주기 관리가 UIApplicationDelegate를 통해 진행되었다고 한다.
이로 인해 어플 상태 전환이 어플의 전반적인 UI에서 영향이 있었다고...

**iOS12 이전 어플 생명 주기** 🚀 나름의 정답?
앱 생명 주기를 관리 및 처리하는 방법과 흐름은 아래와 같다.
1. application(didFinishLaunchingWithOptions): 어플이 실행되며 화면이 출력되기까지 필요한 모든 세팅을 하는 단계
2. applicationDidBecomeActive: 어플이 실행된 단계
3. ApplicationWillResignActive: 실행 이후 다른 행동(홈 화면으로 이동)에서 발생하는 어플 상태 변화 - 어플이 inactive 상태로 전환
4. ApplicationDidEnterBackground: 어플이 background 상태로 전환 알림
5. ApplicationWillEnterForeground: 어플이 다시 호출되며 active 전 단계인 inactive 단계로 전환됨
6. ApplicationdidBecomeActive: 어플이 inactive에서 active 상태로 전환됨
7. ApplicationWillTerminate: 어플이 종료되기 전, not running 상태를 들어가기 직전 호출 (예기치 못한 상황에서는 호출되지 않는다고 한다.)


**iOS 13 이후 어플 생명 주기**
scene별로 고유한 생명주기가 주어졌다! 즉, 어플 뿐만이 아니라 화면 자체가 또 다른 객체로 인식이 된다는 점으로 이해된다.
이로 인해 하나의 scene은 foreground, 또 다른 scene은 background에 있을 수 있다는 점이다!

1. application(didFinishLaunchingWithOptions): 어플이 실행되며 화면이 출력되기까지 필요한 모든 세팅을 하는 단계
2. application(configurationForConnecting): 새로운 scene 탄생 - scene delegation 객체를 지정하는 단계
2.1. Scene(willConnectTo): scene이 연결될 것임을 안내
3. SceneDidBecomeActive: 어플이 Inactive에서 Active로 상태 전환
4. SceneWillRegsignActive: 실행 이후 다른 행동(홈 화면으로 이동)에서 발생하는 어플 상태 변화 - 어플이 inactive로 상태 전환
5. SceneDidEnterBackground: 어플이 background 상태로 전환
6. SceneWillenterForeground: 어플이 Background에서 Inactive 상태로 전환
7. SceneDidBecomeActive: 어플이 inactive에서 Active로 상태 전환
8. sceneDidDisconnected: 연결된 scene 해제를 요청하는 단계
8.1 Application(didDiscardSceneSession): 한개 이상의 scene을 종료시켰을 때 호출 (multitasking window - app switcher)
9. ApplicationWillTerminate: 어플이 종료되기 전, not running 상태를 들어가기 직전 호출 (예기치 못한 상황에서는 호출되지 않는다고 한다.)

[참고 링크](https://velog.io/@ahneve/iOSSwift-%EC%95%B1%EC%9D%98-%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0-Apps-life-cycle)


**그렇다면 appDelegate는 정확하게 어떤 역할을 가지고 있을까?**
어플 생명주기를 담당하는 객체인만큼,
1. 어플의 중앙 데이터 구조를 생성
2. 어플의 Scene들을 설정(생성)
3. 어플 외부에서 발생하는 알림 (notification)에 반응 (eg. 낮은 메모리 안내, 다운로드 완료 알림 등)
4. 어플 자체를 가리키는 이벤트에 대응 (???)
5. 어플 실행 시점에 필수 / 필요 서비스 등록 (apple push notification service)

한마디로 어플의 생성 자체는 AppDelegate가 관리를 하며 Event는 각 Scene별로 발생하기에 SceneDelegate가 담당한다는 점.

**그렇다면 sceneDelegate는?**
SceneDelegate는 UIWindowSceneDelegate 프로토콜을 채택한 하나의 객체로 UserInterface lifeCycle을 관리한다.
이를 통해 하나의 어플에서 multi-scene을 만드는게 가능해졌다고~


### 4. 뷰 컨트롤러 사이를 전환하는 방법에 대해서 설명해주세요.

(답변)

(Personal Thought)
뷰 컨트롤러 사이 전환에는 navigationController, TabBarController, segue, present(modal) 등의 방식이 존재한다.
navigationController는 Stack에 viewController를 쌓아 올려 push, pop할 수 있도록 도와준다.
TabBarController는 navigationController와 달리 하단에 배치된 일종의 버튼들을 통해 화면 전환이 가능한데,
하나의 버튼에 하나의 viewController가 생성된(init) 상황으로 이해할 수 있다. 따라서 navigationController와 달리 '생성'을 시키지 않고 화면 전환 자체만 담당하기에
생성된 화면들은 메모리 상에서 deinit되지 않는다.  
Segue는 스토리보드에서 화면1에서 다음 화면으로 전환된다는 일종의 flow/journey를 보여줄 수 있도록 돕는데, 전환을 담당한다기 보다 이어주는 역할을 한다.
present는 특정 viewController을 push, pop 처럼 화면 전체가 이동되는 모습이 아닌, 화면의 약 7~80%만 띄울 수 있는, modal 형태로 화면 전환이 이루어지는데,
중요한 viewController 또는 정보가 아닌 경우 (광고 등), 사용자들이 쉽게 화면에서 내릴 수 있도록 활용하는 화면 전환 방식이다.

5. 프로퍼티 옵저버(Property Observer)에 대해서 설명해주세요. (didSet, willSet)
6. bound와 frame의 차이에 대해서 설명해주세요.
7. Codable 프로토콜을 사용하여 JSON 데이터를 Swift 객체로 어떻게 디코딩하나요?
8. Auto Layout에서 스택 뷰와 같은 컨테이너 뷰의 역할과 사용법은 무엇인가요? 
9. Grand Central Dispatch (GCD)와 Operation Queue의 차이점은 무엇인가요?
10. 탈출 클로저(escaping closure)에 대해 설명해주세요.

### 11. 옵셔널에 대해 설명해주세요

(답변)

(Personal Thought)
- 값이 있을수도 있고 없을수도 있다는 것을 개발자 관점에서 명시하기 위해 사용하는 표현이다.
- optional은 물음표로 활용하는데, 변수 선언이나 API 호출 이후 받는 데이터의 유무를 판단하지 않고 받았을수도 - 안 받았을수도 있다는 가정을 세울 수 있게한다.
- 옵셔널이 탄생한 이유는 API 통신 같은 경우 - 호출 이후 데이터를 무사히, 무조건 받았을 것이라는 가정을 할 수 없기 때문이다.
일련의 에러가 발생했거나 사건으로 인해 아직 100% 데이터를 받지 못한 상황에서 데이터 타입을 명시하게 되면 어플이나 IDE 측면에서 오류로 인식을 하게 되는데, 이 때 어플은 강제 종료하게 된다. 이러한 상황을 방지하고자 옵셔널의 키워드가 만들어졌다.
더불어 변수의 경우 옵셔널을 사용하여 언제 선언을 할지, 시점을 조절할 수 있게 되는데 - 옵셔널로 선언할 경우, 해당 변수 - 상수의 데이터 공간을 잡아두지 않고 선언 시점 전까지 비워두며 선언이 된 이후 메모리를 차지할 수 있게 된다.

단, 옵셔널은 에러를 방지한다는 장점이 있지만 양날의 검인데
에러가 발생할수도 있는 상황에서

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
