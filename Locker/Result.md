# Result

**Swift 5이후부터 적용된 더 깔끔한 에러 핸들링 방법.**<br/>
- nil이 포함됐을 때 이론적으로 가능한 값은 4가지. (nil, error), (nil, nil), (result, error), (result, nil)<br/>
Result 덕분에 success, failure 2가지로만 값을 반환할 수 있게되며 오류 가능성 또한 줄어든다.<br/>

[원본 proposal 글](https://github.com/apple/swift-evolution/blob/main/proposals/0235-add-result.md)

## use case
```swift
func fetchPokemon(completion: @escaping (Result<Pokemon, NetworkError>) -> Void) {
    let url = "some url"

    guard let url = URL(string: endPoint) else {
        completion(.failure(.invalidURL))
        return
    }

    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
        guard let self = self else {
            return
        }
                
        if let _ = error {
            completion(.failure(.networkError))
            return
        }
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completion(.failure(.invalidResponse))
            return
        }
                
        guard let data = data else {
            completion(.failure(.noDataReturned))
            return
        }
                
        do {
            let pokemonData = try decoder.decode(Pokemon.self, from: data)
            completion(.success(pokemonData))
        } catch {
            completion(.failure(.invalidDataFormat))
        }
    }
    task.resume()
}
```

## Result는 무엇이 다른걸까?
- **결과값이 성공 **또는** 오류 값으로 귀결되며 컴파일러 단계에서 오류를 쉽고 빠르게 잡을 수 있다는 점.**<br/>더불어 이전에는 개발자가 반환 값의 타입을 직접 할당하다보니 nil을 고려하면서 어떤 값이 올지 정리를 해야했는데, Result 하나로 <success, failure> 로 정리가 된다는 점.
- **한 곳에서 에러 대응 값을 바꾼다는 점에서 편함.**<br/>
일반 타입으로 에러를 회신할 경우, call site에서 각 에러의 값을 일일이 작성해야했다.
- **Result로 Error의 타입을 지정함으로써 예상을 벗어난 에러를 받을 가능성이 줄어듦.**

## Result 더 알아보기
- **get() 메서드로도 success와 failure 값을 따로 호출받을 수 있다.**<br/>
*그동안 Result를 오로지 네트워크에서만 처리를 했기 때문에 따로 가능한지 몰랐다.*

    ```swift
    let intValue: Result<Int, Error?> = .success(5)
    do {
        let result = try intValue.get()
        print("최종 값은 \(result)이다")
    } catch {
        // handle error
    }
    ```

- **Result Error Handling을 Swift에서 제공하는 Error로 사용하기를 권장한다.**<br/>
평소에는 NetworkError 같은 커스텀 Error을 생성하고 각 케이스에 맞게 값을 반환하도록 했는데, Error을 채택하면 더 다양한 코드를 활용할 수 있다고 한다.<br/>아래와 같은 상황이 될 수 있지 않을까..? 싶다.

    ```swift
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        // NetworkError가 아닌 Error로 선언할 경우
    }

    fetchData { result in
        switch result {
            case .success(let data):
                print("데이터가 있습니다. \(data)")
            // 활용하는 call site에서 error를 다양하게 바꿀 수 있게 된다.
            case .failure(let error):
                if let networkError = error as? NetworkError {
                    switch networkError {
                        case .invalidParsing
                        case .wrongNetworkCall
                    }
                } else {
                    let error = error as? DefaultError {
                        print(error.localDescription)
                    }
                }
        }
    }
    ```

<br/><br/>
# What I don't understand
### Invalid Conversion from throwing function
결국 Error 핸들링만 따로 처리해야한다면 Enum으로 throw 처리하는 것과 어떤 차이점이 있는걸까?

```swift
func fetchPokemon() throws -> Pokemon {
    let pokemonIndex = Int.random(in: 1...4)
    let endPoint = baseUrl + "\(pokemonIndex)"
    
    guard let url = URL(string: endPoint) else {
        throw NetworkError.invalidURL
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        do {
            guard let data = data, let response = response as? HTTPURLResponse else {
                throw NetworkError.networkError
            }
            
            guard let response.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            let result = try decoder.decode(Pokemon.self, from: data)
            
            catch {
                
            }
        }
    }
}
```

switch result {} 로 성공과 실패했을 때 각각의 값을 지정하지 않는다는 점에서 복잡해지는 경우가 있다.
오류 값을 처리하는 시간도 고려된다. throw를 할 경우, 우리는 각 Error handling을 바로 하게 된다.
error = error, response = response 처럼 각 에러에 대한 값을 가드문으로 확인하면서 바로 처리해야하지만, Result를 사용하면 우리가 준비된 시점에 처리를 할 수 있도록 미룰 수 있다.

<br/>

## 참고 링크
- [HackingWithSwift](https://www.hackingwithswift.com/articles/161/how-to-use-result-in-swift)
- [sundell](https://www.swiftbysundell.com/articles/the-power-of-result-types-in-swift/)
- [Writing failable Asynchronous API calls](https://developer.apple.com/documentation/swift/writing-failable-asynchronous-apis)