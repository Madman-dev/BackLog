# 230711 객체와 인스턴스의 차이점
<br/>

## TIL(Today I Learned)
### 학습내용
오늘은 이전에 야곰에서 공부했던 내용을 다시 복습하는 시간을 가졌다.<br/>
그러던 중, 객체와 인스턴스에 대해 언급하는 포인트를 보면서 어떤 점이 다르기에 Object, Instance로 구분하는지 궁금해졌다.<br/>
줄여서 보면, 객체(Object)는 클래스에서 바로 생성된 (instantiated) 객체라 부르고 인스턴스는 생성된 객체를 복사 담아갈 경우 사용되는 용어였다.
<br/><br/>
## 세부 내용 + 코드 활용
분명히 한번 찾아봤던 내용이었는데, 다시 확인하니 조금 더 이해하게 된 것 같다.

```Swift
class House {
  let rooms: Int
  let windows: Int
  let hasKitchen: Bool
  let hasDoor: Bool
}
```
다소 엉뚱한 코드이긴 하지만 위와 같이 집 클래스가 있다고 해보자. <br/>
클래스는 예전부터 설계도, 붕어빵틀 등등 찍어낼 수 있는 모형이라고 했다. (이것도 할말이 많지만) <br/><br/>
***중요한 건, 위와 같은 클래스로 생성을 하는 것이 객체(object)라는 것이다.***

```Swift
let myHome = House(rooms: 3, windows: 3, hasKitchen: true, hasDoor: true)
```
원문에서 확인한 내용은, <br/>
objects are result of instantiating a class. Instantiation is the process of taking the blueprint and defining each attribute<br/>and behavior so that the resultant object actually represents a real life object. 라고 설명을 한다.<br/><br/>
결국, 클래스를 통해 초기화한 / 생성한 것을 객체(object)라고 하며, 방과 창문은 몇 개인지, 문과 부엌은 있는지 등을 확인해서 메모리에 올리는 실체화 과정을 거친다는 점이 있겠다. <br/>

#### 참고
- https://www.differencebetween.com/difference-between-object-and-vs-instance/
- https://www.codementor.io/@stevedonovan/class-vs-object-vs-instance-14i2s2lu6r
