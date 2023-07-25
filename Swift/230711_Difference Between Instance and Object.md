# 230711 객체와 인스턴스의 차이점

## TIL(Today I Learned)

### 학습내용
> 0725 복잡하게 설명한 것 같아 다시 정리해보았다.

오늘은 이전에 야곰에서 공부했던 내용을 다시 복습하는 시간을 가졌다.<br/>
그러던 중, 객체와 인스턴스에 대해 언급하는 포인트를 보면서 어떤 점이 다르기에 Object, Instance로 구분하는지 궁금해졌다.<br/>
줄여서 보면, 객체(Object)는 클래스에서 바로 생성된 (instantiated) 객체라 부르고 인스턴스는 생성된 객체를 복사 담아갈 경우 사용되는 용어였다.
<br/><br/>
## 세부 내용 + 코드 활용
분명히 한번 찾아봤던 내용이었는데, 다시 확인하니 조금 더 이해하게 된 것 같다.

```Swift
class Unit {
  let name: String
  var hasWeapon: Bool
  let inventory: [String] 

  func walk() {}
  func attack() {}
  func communicate() {}
}
```
다소 엉뚱한 코드이긴 하지만 위와 같이 한 유닛의 클래스가 있다고 해보자. <br/>
클래스는 예전부터 설계도, 붕어빵틀 등등 찍어낼 수 있는 모형이라고 했다.
<br/>
객체 관련해서 배울 때 대부분 붕어빵 틀을 비교를 한다.
하지만, 기억하기로 '붕어빵의 틀'이라고 하기에는 많이 간소화된 부분이 많았다.<br/> 클래스에서 외적으로 비슷한 친구들이 생성 되기에 '틀'을 비유하기에는 할 수 있는 객체가 가지는 행동, 특성들을 잘 담아내지는 못했다고 생각한다.
<br/><br/>
***아무튼 중요한 건, 위와 같은 클래스로 생성을 하는 것이 객체(object)라는 것이다.***

```Swift
let newCharacter = Unit(name: "Marine", hasWeapon: true, inventory: [])
```
위와 같이 class를 사용해서 객체를 생성할 수 있는데,<br/>
객체는 클래스에서 만들어낸, 클래스를 따라 구성한 실체이다.

원문은, <br/>
objects are result of instantiating a class. Instantiation is the process of taking the blueprint and defining each attribute<br/>and behavior so that the resultant object actually represents a real life object. 라고 설명을 한다.<br/><br/>
이는 객체는 클래스에서 제공하는 프로퍼티, 메소드를 활용해서 생성하는 것. 이라고 설명을 한다.
그렇다면 Instance는 뭐가 다를까??
더 찾아보니 Instance는 객체와 큰 구별을 할 수 없는데, 담고 있는 값이 동일해서 이다.<br/> 하지만, 가장 큰 차이점은 객체의 데이터의 주소 값을 담아 간 **객체의 복제본**으로 볼 수 있다.

결국, 클래스를 통해 초기화한 / 생성한 것을 객체(object)라고 하며, instance는 해당 원본(객체)를 복사한 복제본과 비슷하다고 보면 될 듯하다. 큰 틀로 보면, Instance는 object에 포함되는 친구라 볼 수 있는데, 원본에서 생성되었다~ 라는 점에서 의미에서 복제본이라고 할 뿐, 완전히 다른 생명체라고 보기에는 어려울 것 같다.~~방과 창문은 몇 개인지, 문과 부엌은 있는지 등을 확인해서 메모리에 올리는 실체화 과정을 거친다는 점이 있겠다.(너무 복잡한 관계로 삭제)~~ <br/>

#### 참고
- https://www.differencebetween.com/difference-between-object-and-vs-instance/
- https://www.codementor.io/@stevedonovan/class-vs-object-vs-instance-14i2s2lu6r
- https://stackoverflow.com/questions/3323330/difference-between-object-and-instance