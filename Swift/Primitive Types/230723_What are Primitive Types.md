# 230723_What are Primitive Types

## TIGO(Today I Go Over)
### Primitive Type는 무엇을 의미하는건가?
- Swift를 포함한 모든 프로그래밍 언어에 있어 기본적인 타입이 존재한다.<br/>
특정 프로세서에서 받아들이는 제한된 데이터 타입을 뜻하는데, 대다수의 프로세서는 비슷한 데이터 타입들을 '기본 데이터 타입'으로 지정한다. (개인적으로 알아 봐야 하는 부분이 많이 있다!)<br/> 우선 기본적으로 Swift 언어에서 Primitive라고 하는 타입을 정리해보았다.

    1. Integer
    2. Float and Double
    3. Boolean
    4. String and Character
    5. Optional
    6. Tuple

이 키워드는 하나의 데이터를 의미하는데, 데이터의 종류가 달라 Type이라 불린다.<br/>담는 데이터 타읩과 예시를 조금씩 되돌아 보고자하는데, 그 중 Integer을 먼저 본다. 

## 세부 내용 + 코드 활용
- ### Integer (정수)<br/>
    우리가 흔히 사용하는 숫자 중 정수를 의미한다.<br/>
    0을 포함한 모든 자연수를 정수라 부르는데, 음수의 값도 가능하다.<br/>
    컴퓨터의 경우, 한번 지정한 타입은 다른 타입으로 변경이 되지 않기에 Int라는 타입을 적었으면<br/> 다른 타입의 데이터를 담을 수 없게 된다.

    정수(Integer)는 특정 범위에 따라 불리는 타입이 다르다.
    byte, bit 등등 더 많은 이유가 존재하지만, 일단 간단하게 이해한다면 아래와 같다.
    - Int8
    - Int16
    - Int32
    - Int64
    - UInt
    <br/>
    담을 수 있는 바이트(byte)에 따라 담을 수 있는 최소 값과 최대 값이 다르다.
    (binary와 byte에 대해서 추가 공부해봐야겠다!)
    그래도 쉽게 말하지만, 정수의 최소값과 최대값의 범위는 Int8보다 Int64가 더 넓으며
    UInt는 0을 포함해, 양의 정수만 가지고 있는 타입을 의미한다.


#### 참고
- https://seons-dev.tistory.com/entry/Swift-기초문법-데이터-타입1-Int와-UInt-feat카멜케이스
- https://en.wikipedia.org/wiki/Integer_(computer_science)
