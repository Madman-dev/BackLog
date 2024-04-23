# margin과 padding은 어떻게 다를까?
## TIL(Today I Learned)
예전에 어플을 구현해볼 때 두 content, view 사이에 간격을 주기 위해 padding이라는 걸 사용했다. padding: 10 이런 식으로 값을 줘서 사이 범위를 늘리거나 좁혔는데, <br/>'margin'이라는 키워드가 있다고 한다! <br/>둘 다 간격을 조절해주는 키워드인 것처럼 보이던데, 어떤 차이점이 있는걸까?

- **Margin: 요소의 표면에서 값이 적용된다.**<br/>쉽게 말하면 동준 이라는 사람이 있고, 동훈이라는 사람이 있다고 가정하자. 동준이라는 사람이 약 1m 길이의 팔을 벌려 동훈이라는 사람과 간격을 만들었다하자. 동준은 팔로 동훈의 어깨를 터치하되, 다가오지 못하게 한다면 동준은 padding 1m의 간격을 만들었다고 볼 수 있다. (더 쉬운 설명이 있을지 고민해보자!)<br/>

- **Padding**<br/>
놀랍게도 Padding은 속에 있는 요소의 위치를 조절 할 때 사용되는 키워드였다.<br/>
한때 유행했던 예일 티셔츠를 생각해보면 비교적 이해하기 쉬울 듯하다!<br/>
우리는 YALE이라는 한 textLabel 요소를 가슴 중앙에 배치하기 위해서,<br/> padding을 통해 **티셔츠 앞 면의 위치를 조절할 수 있다.**
<br/><br/>margin은 외부의 다른 요소와의 간격을 의미한다면,<br/> padding은 내부 콘텐츠의 위치를 조절하는 것과 같다!

<br/>

#### 참고
- https://blog.hubspot.com/website/css-margin-vs-padding#:~:text=In%20CSS%2C%20a%20margin%20is,the%20space%20inside%20an%20element.