# WWDC19 - Optimizing App Launch

## 1. What is Launch
- user interaction interruption
Launch Spped
어플이 실행되기 까지 걸리는 시간
1ms을 개선하면 162일을 줄일 수 있다는 점.

Luanch는 사용자가 마주하는 어플과의 첫 관계 - 경험
launching이 안좋으면 어플의 다른 부분에서 문제가 있을 것이라고 오해를 키울 것

### Different types of Launches
a. Cold Launch
- 리부트 이후
- 메모리에 없는 경우
- 실행되는 프로세스가 하나도 없을 때

b. warm Launch
- 최근 어플이 종료됨
- 존재하는 어플의 메모리
- 실행되는 프로세스가 하나도 없을 때

c. resume
- 어플은 메모리에 온전히 있다
- 임시로 어플을 내린 상황 (suspended)
- 실행되는 프로세스가 있다

중점은 resume처럼 어플이 실행되면 좋지 않을까
첫 런치를 400ms 내로 실행해야한다는 점 (first frame)


## phases of app launch

### Application Initalization 단계
어플 탭
어플 생성 (initialization 100ms)
프레임 생성까지 300ms 남음 - 어플은 이때 interaction이 가능해야한다
마지막 프레임 구현까지 600ms


**어플에 Dynamic Linker 적용, runtime dependency를 캐싱하여 warm Launch를 더 빠르게 할 수 있도록**
따라서 의존성 프레임워크는 무조건 연결을 하고 사용하지 않는 프레임워크들은 삭제?


static initialization을 추천하지 않는다.
빠른 구현을 위해 API를 활용하거나 // 무엇인지는 모르겠다
class load 밖으로 빼라고 한다. (or Lazy load using class initialize) // 무엇인지는 모르겠다


**application initialization lifecycle callbacks**
iOS13 이전까지는 application init(생성)은 아래 메서드를 호출하면서 실행됐다.

1. willfinishLaunchinwithoptions
2. didfinishLaunchinwithoptions

화면이 보여지게 되면서  applicationDidBecomeActive가 호출.


scene을 활용하면서는 didFinishLaunch만 활용하라고 하는데, 이제는 다르게 작동하기 때문.
applicationDidBecomeActive 대신,
sceneWillConnectToSession: ViewController를 해당 메서드에서 생성, didFinishLaunching에도 넣으면 퍼포먼스 이슈 발생
SceeneWillEnterForeground
SceneDidBecomeActive가 탄생


- share resources between scenes. 관련해서는 (multitasking and the aplication Lifecycle / getting the most out of multitasking 확인)


### First Frame Render phase 단계
화면을 그리는 단계에서 시간을 단축하기 위해서는
1. 뷰 계층을 flat 또는 lazy하게 로드하거나
2. autolayout의 갯수를 조절하면 좋다 (high Performance autolayout을 참고)

### Extended Phase 단계
- 이건 이해 안된다.

## 2. How to properly measure your launch

XCTest를 통해 Launch performance를 확인할 수 있다!
관련해서는 추후 서술

## 3. Using Instrument to profile your launch
1. minimize:
- 첫 프레임에 불필요한 로를 줄여라
- move blocking main thread
- reduce memory usage
2. prioritize
3. optimize



// MARK: - Improving Launch with demo

/*
- 퍼포먼스 관련해서 작업을 하기 전에 Profile scheme을 확인할 것
* ensure xcode to recompile app in release mode > compiler's time optimization!

어플 속도 향상 관련해서 instrument를 사용하면 어플의 실행 속도 및 전체적인 프로세스를 시각적으로 보여준다
Analyze and checks up on data for our app
*/

(App Launch Phases)
- Before main function is invoked = purple
- As app finishes its launch initial setup = green

### Thread State
쓰레드의 프로세스를 볼 수 있는 상황, *Thread State*
시각적으로 보면 4가지의 상태가 있어보인다.
- Gray: Thread is Blocked
- Red: Thread is being/ will be used & running - but lacks CPU resources
- Orange: Higher priority has taken over the use of thread, leaving the app in a preempted state
- blue: working on CPU core

### 여전히 어려운 Instrument
시간을 아낄 수 있을 것이라 생각했던 Instrument가 사실 정말 복잡했다.
하나도 이해가 안 되는 상황이었는데, 데모에서 보여주던 것과 같은 내용이 없었기 떄문에 많이 헤맸던 것 같다.
그럼에도 불구하고 Instrument를 조금은 찾아보고 공부해야겠다는 생각이 강하게 들었는데, 