# 모듈화

### Monolithic Architecture
- A traditional model of a software program built as unified unit that is self-contained and independent from other applications.
- A monolithic architecture is a singular, large computing network with one code base that couples all of business concerns together.

즉, 모든 코드가 합쳐져 있다는 점.
그렇기에
1. 쉬운 배포
2. 쉬운 개발
3. 성능
4. end to end test
5. 디버깅
이 가능하다고 하는데, 

실질적으로 적용해서 코드 베이스를 쌓다보면,
1. 결합도 증가
2. 영향 받는 범위 증가
3. 안정성 저하
가 발생하여 코드 및 시스템 구조를 파악하는 비용의 증가한다고 한다.

Monolithic에서 Modular로 변하게 된다.

기능을 추가해도 Legacy 코드가 늘어나, 안전성이 떨어지고 -
해당 이슈를 해결하고자 새로 리쿠르트를 하더라도 conflict가 증가하여 결국 유지보수 비용이 증가하게 되는 상황이 발생한다고 한다.

### Modular Architecture

모듈 아키텍쳐는 프로그램 기능 분리에 집중된 기술이다.



출처
- https://www.youtube.com/watch?v=BjK42O8Lt48