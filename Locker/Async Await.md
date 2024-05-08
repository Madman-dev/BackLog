# Async Await
## 🥚 사용 예시
```swift
func fetchPokemon() async throws -> Pokemon {
    let endpoint = "some end point URL"
    guard let url = URL(string: endPoint) else {
        throw NetworkError.invalidURL
    }
    
    // try는 @escaping에 사용되었던 completionHandler와 비슷한 역할
    // await로 동기 메서드가 스레드를 막지 않음
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw NetworkError.invalidResponse
    }
    
    do {
        return try decoder.decode(Pokemon.self, from: data)
    } catch {
        throw NetworkError.invalidDataFormat
    }
}
```

## 🐣 More About...
- 메서드의 비동기 처리를 쉽게 지원하는 기능이자 키워드
- 덕부에 시스템은 비동기 메서드를 실행하고 다른 작업을 할 수 있게 된다
- Apple에서는 비동기 작업이 이뤄질 가능성이 있을 경우 await를 사용하기를 권장하는데, 개발자에게 다른 작업이 먼저 실행될 수 있다는 점을 알려야 하기 때문
- async 키워드는 메서드에 '임시 정지' 기능을 부여하는 것과 동일하다. 따라서 call site에서도 async를 사용해야 한다
- Swift 5.5 이후, Xcode compiler에서 자동으로 async await를 추천해준다고 한다.
- Task를 활용하여 비동기 작업이 처리된다. [[Jump to Task]](#task)


## 🐥 @escaping과 달리...
1. Linear Code가 가능 (순서대로 처리되는 과정)
2. 비동기와 동기 메서드를 함께 실행 가능(?)
3. 코드 실행 이후 - 오류 또는 결과값에 대한 처리를 **항상** 하도록 flag를 올린다.<br/>
*completion에서 return을 하더라도 throw로 처리를 해야하기 때문*<br/><br/>
더불어 메서드 뿐만 아니라 프로퍼티 또한 비동기 처리가 가능해진다.<br/><br/>

## 🚨 Escaping의 문제점
1. **오류 호출을 잊을 수 있음**<br>
    **return만 하고 completion을 호출하지 않을 경우 -**<br>이런 경우, 사용자는 UI 업데이트 혹은 안내 없이 계속해서 빈 이미지를 맞이하게 된다.<br>따라서 오류가 났을 때에도 문제점을 알리는 것은 중요하다!


2. **오류를 간결하게 처리할 수 있음**
<img src="./imageAssets/Async/result와 비교.png">
    이미지를 받기 위해 실행해야 했던 4가지의 메서드 (2개 비동기, 2개 동기)를 위해 5개의 오류 처리를 해야한다.<br/> **원하는 기능을 구현할 수 있지만, 오류 처리를 빠르게 이해하기 어렵고 의도 또한 파악하기 어렵다는 점**

2. **무한 callback**

[Jump to EscapingClosure](./@Escaping%20errorHandling.md)

## 연관 키워드
### 1. Task
- **비동기 작업을 실행하는 작업 단위**<br>
Task 객체를 생성하면 Task 객체가 실행할 수 있는 클로저를 만들어야 한다.<br>
Task는 생성 이후 바로 실행이 가능하며 별도 실행 시간대를 정하지 않아도 된다.
