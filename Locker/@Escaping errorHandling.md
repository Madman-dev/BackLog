# @escaping

- 일반 메서드는 non escaping이기에 메서드를 실행해서 얻은 값은 메서드 **내부에서만** 존재하며 죽는다.
- escaping을 활용하면 메서드에서 발생하는 결과값 또는 오류는 메서드 종류 이후에도 존재하며 call site로 해당 값을 던질 수 있게 된다.<br/>
*다른 파일에서 해당 메서드의 값을 받아 처리할 수 있게 된다는 점*

### 사용 예시
```swift
func fetchPokemon(completionHandler: @escaping (Result<Pokemon, Error>) -> Void {

    let endpoint = "some base url + url"
    guard let url = URL(string: endpoint) else { return completion(.failure(NetworkError.invalidURL)) }

    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
        guard let self = self else { return }
        
        if let _ = error {
            completion(.failure(NetworkError.networkError))
            return
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completion(.failure(NetworkError.invalidResponse))
            return
        }
        
        guard let data = data else {
            completion(.failure(NetworkError.noDataReturned))
            return
        }
        
        do {
            let pokemonData = try decoder.decode(Pokemon.self, from: data)
            completion(.success(pokemonData))
        } catch {
            completion(.failure(NetworkError.invalidDataFormat))
        }
    }
    task.resume()
} 
```

## @escaping 호출 방식
URLSession에서부터 코드가 실행되는 순서를 바라보자.
1. task에 URLSession의 값이 답긴다.<br/>
2. task.resume() 메서드가 먼저 실행된다.<br/>
3. 결과값 (data 또는 오류)을 일일히 분석하게 된다.<br/>
ㄴ 3.1. error가 있는지 확인<br/>
ㄴ 3.2. response가 정확한지 확인<br/>
ㄴ 3.3. data 값을 확인<br/>
4. data를 디코딩하여 결과값(가져온 데이터 또는 오류)를 call site에 전달
<br/><br/>
### 쓰레드 실행 과정
2가지 쓰레드를 활용한다.
1. fetchPokemon이 호출된 call site의 큐 혹은 스레드
2. URLSession은 session delegate queue
3. 이미지를 업데이트 하는 경우, 메인 쓰레드까지 총 3개의 스레드를 사용한다.
```swift
DispatchQueue.main.async {
    // image는 메인 스레드에서 실행된다.
}
```

- 컴파일러에서 스레드 이슈를 확인할 수 없기에 data race, thread 관련 문제가 발생할 가능성이 높다.
<br/><br/>

## completion Handler 문제 예시
```swift
func fetchPhoto(url: URL, completionHandler: @escaping (UIImage?, Error?) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completionHandler(nil, error)
        }
        
        if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            DispatchQueue.main.async {
                completionHandler(UIImage(data: data), nil)
            }
        } else {
            completionHandler(nil, error)
        }
    }
    task.resume()
}
```
- 위 코드에서 오류는 2번 호출될 수 있다. 똑같은 오류가 error = error와 completionHandler(nil, error) 부분에 걸리기 때문.
- completionHandler는 main queue에서 항상 실행되지 않을 수가 있다.
- 이미지 또한 다른 포맷일 경우, nil을 반환할 수 있다.

### Async await로 보완
```swift
func fetchPhoto(url: URL) async throws -> UIImage {
        
        // 비동기 처리로 데이터를 전달한다. - thread not blocked
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        guard let image = UIImage(data: data) else {
            throw NetworkError.invalidDataFormat
        }
        return image
    }
```
- 단방향 흐름으로 코드가 진행되기에 더이상 여기저기 이동하는 부분은 확인하지 않아도 된다.
- call site 큐, 스레드에서만 진행되기에 threading 문제 또한 걱정하지 않아도 된다.

## Problems when using
- completionHandler의 가장 큰 문제점은 호출을 따로 하지 않아도 compiling 단계에서는 실행이 된다는 점!!!
```swift
import Foundation

func fetchData(url: URL, _ completion: @escaping (Result<Data, Error>) -> Void {
    URLSession.shared.dataTask(with: url) { data, _, error in
        guard error == nil else {
            // completion(.failure(error!)) > 해당 completion을 호출하지 않아도 문제가 없는걸로 인식한다.
            return
        }

        guard let data else {
            completion(.failure(NetworkError.noData))
            return
        }

        completion(.sucess(data))
    }
    .resuume()
}
```
- 간단한 어플같은 경우 문제는 없겠지만, production quality를 가진 어플의 경우 어디에서 어떤 이유로 문제가 발생하는지 파악하기 힘들어진다. completion 코드를 넣지 않았기에 crash가 발생하더라도 오류가 던져지지 않아 모든 코드를 확인해야하는 불상사도 발생할 가능성이 있다...

- 해당 문제점을 해결하기 위해 safely using completionHandler를 활용할 수 있지만, 특정 데이터 타입을 선언했을 경우 불가능하다. 전달하는 데이터 타입이 Data일 경우에만 defer를 활용해서 적용할 수 있다. [[관련 링크]](https://www.swiftwithvincent.com/blog/how-to-make-a-completionhandler-much-safer)
- 해야했던 만큼, nil 값도 할당했다.
- 이 상황에서 실제로 값이 돌아오는지, 0인지 error인지, 값은 있는지, nil인지 등을 고려하다보니 
