 # What IS Clean Architecture?

클린 아키텍쳐란 앱 또는 소프트웨어 개발에서 코드를 구성하고 조직화하는 방식
코드를 구조화 > 유보수성 높이고 > 테트 가능 > 재사용성을 높이기 위함

의미없는 아키텍쳐는 사실 중요하지 않다.


### MVC
Model, View, Controller로 구성되어 있는 구조
Controller에서 유저 인풋을 받아들인다. View와 Model에서 Controller에 발생한 변화를 적용, 업데이트하는 과정을 거친다.
Controller를 통해 데이터를 업데이트할 뿐, Model과 View는 서로 공유하는 정보가 일절없다.

Controller gets MASSIVE!
also the controll needs to update both the view and the model.
Too Much Work is going on

### MVVM
Model, ViewModel, Model로 구성되어 있는 구조
View에서 직접 사용자 input을 받는다. View에서 생긴 변화는 ViewModel에서 데이터를 처리하며, VM에서 Model의 데이터를 변화하게 된다.
ViewModel에 생긴 변화를 View에 보여주기 위해선 Binding이 필요해진다.

But similar to MVC, ViewModel becomes MASSIVE!


> 우리가 아키텍처를 사용하는 이유는
1. 구조적
2. 확장 가능성
3. 유지 보수
4. 테스트 가능
을 개선하기 위해서였다!

아키텍쳐에는 문제가 없다고 한다.
사실 필요한 과정을 그대로 제공하고 있었다고!


## Implementing Clean Architecture
1. 소프트웨어를 계층으로 나누어 관심사를 분리하자

Presentation(changeable) - UI, Controllers
Domain(unchangeable) - Use cases, Entities
Data(changeable) - Repository



What is hard to change?
The important stuff

- what is considered as the key thing in the system?
- when working, what needs to be on top of my mind?

feature >> software design?
Economics vs Craftsmanship

architecture is an internal quality whereas we are looking into external quality
The problem is to make money


Why architecture is important depends upon long-term
Without design, as time flows - it gets difficult to add new features.
Through learning clean architecture and being able to implement it within the given project,
in the long term we are able to add on new things that will be easier. Although it would mean you lose at the first step.

### 참고
- https://www.youtube.com/watch?v=DngAZyWMGR0&t=0s