/*
 공부를 하고 난 이후,
 escaping closure를 활용할 수 있는데 왜 async를 써야할까 생각했다.
 어떤 문제점이 있을까 생각했지만, 사실상 문제는 없는 것 같다.
 단, 동시에 @escaping과 async가 사용되는 이유를 생각해보면 나름 간단해지는 것 같다.
 
 함수가 실행한 이후 해당 결과값이 돌아오기까지 안 기다려도 되는 이유가 가장 크다. the system resumes your code where it left off and continues executing the rest of the code.
 
 
 =======
 actor를 활용하면 안전하게 변환 가능한 상태로 접근을 할 수 있게 된다.
 하지만 느리고 버그가 많은 코드에 concurrency를 더한다고 해서 결과값이 옳게 혹은 빠르게 온다는 보장이 되지 않는다.
 
 concurrency 자체가 thread 위에 만들어진 작업이다.
 하지만 직접적으로 스레드와 작업을 하지 않는다. 따라서 비동기적으로 작업을 요청하게 되면 어떤 스레드를 사용할지 보장되지 않는다.
 
 
 When learning concurrency in Swift, we learn with Escaping closures / completions
 Then we grow to learn more with async and await. Task etc.
 
 + Async marks the function as asynchronous, leading the task to perform without blocking the main thread.
 throws를 함께 활용하면 에러또한 던질 수 있게 된다.
 func fetchImageDate() async throws -> Data {
 let data = await downloadImage()
 return data
 }
 
 참고로 비동기 처리하는 함수 내부에 활용하는 함수 또한 async를 활용해야한다.
 
 + Await on the other hand listens to the asynchronous function until the action/task is complete.
 You place the await keyword wherever you need to call an Async function.
 await는 쉬어가는 시점을 알리는 것과 동일하다. 비동기 함수의 결과값이 되돌아오는 시점까지 대기하는 것과 비슷하다고 볼 수 있다.
 eg) one well-used cases of async functions are when downloading data with URLSession. 기기 자체의 속도는 빠르지만 웹사이트에 데이터를 올리고 내리는 과정은 오랜 시간이 걸린다. 이 경우 함수는 데이터를 온전히 다운 받은 이후까지 기다려야 한다. @escaping을 활용한 클로저의 경우 데이터를 받는데까지 시간 딜레이가 발생하기 때문에 여러번 호출될 수 있는 가능성을 가지게 된다.
 
 + Task is the structure that executes and manages asynchronous tasks. - I works alongside Async keyword.
 it creates an environment that enables us to execute asynchronous methods or functions.
 >> Structured Concurrency.
 */

import Foundation

//var number: Int = 4
//
//func getNumber(completion: @escaping ((Int) -> Void)) {
//    completion(number)
//}
//
//getNumber { number in
//    print(number)
//}

// MARK: - Testing Nested escaping closures

func addOne(to number: Int, completion: @escaping ((Int) -> Void)) {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    let nextNumber = number + 1
    completion(nextNumber)
}

func addTwo(to number: Int, completion: @escaping ((Int) -> Void)) {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    let nextNumber = number + 2
    completion(nextNumber)
}

func addThree(to number: Int, completion: @escaping ((Int) -> Void)) {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    let nextNumber = number + 3
    completion(nextNumber)
}

func addFour(to number: Int, completion: @escaping ((Int) -> Void)) {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    let nextNumber = number + 4
    completion(nextNumber)
}

func addFive(to number: Int, completion: @escaping ((Int) -> Void)) {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    let nextNumber = number + 5
    completion(nextNumber)
}

//print("0부터 시작")
//addOne(to: 0) { firstNum in
//    addTwo(to: firstNum) { secondNum in
//        addThree(to: secondNum) { thirdNum in
//            addFour(to: thirdNum) { fourthNum in
//                addFive(to: fourthNum) { fifthNum in
//                    print("이렇게 하면 숫자는 \(fifthNum)")
//                    // 각자 sleep 함수가 담겨 있고 서로 호출하다보니 각자의 값이 완료된 이후 해당 값을 담아서 전달하는 과정으로 15라는 최종 결과값을 도출
//                }
//            }
//        }
//    }
//}


// Async Await

func addOne(to number: Int) async -> Int {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    return number + 1
}

func addTwo(to number: Int) async -> Int {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    return number + 2
}

func addThree(to number: Int) async -> Int {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    return number + 3
}

func addFour(to number: Int) -> Int {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    return number + 4
}

func addFive(to number: Int) async -> Int {
    print("기대하는 함수 호출은 \(#function)")
    sleep(2)
    return number + 5
}

//Task.init {
//    print("Start with Zero")
//
//    let firstNumber = await addOne(to: 0)
//    let secondNumber = await addTwo(to: firstNumber)
//    let thirdNumber = await addThree(to: secondNumber)
//    let fourthNumber = await addFour(to: thirdNumber) // async를 하지 않았기에 sync로 인지를 하고 UI가 얼었을 가능성이 커진다.
//    let fifthNumber = await addFive(to: fourthNumber)
//
//    print(fifthNumber)
//}



// MARK: - Testing sync function within async function

func asynchronousFunction(with num: Int) async -> Int {
    return num
}

func synchronousFunction(with num: Int, completion: @escaping ((Int) -> Void)) {
    print("여기는 동기 함수, \(num)")
    //    try asynchronousFunction(with: num) >> 호출 자체 불가
    completion(num)
}

//MARK: - 비동기가 동기 처리 함수 호출
//asynchronousFunction(with: 2)
// 비동기 내부에 동기를 호출할 수 없다.

//MARK: - 동기가 비동기 처리 함수 호출
// 호출 자체가 불가능 - 오류 발생


/*
 1. 가독성 면에서 async await를 활용하는 방향이 가장 좋다.
 2. 에러 핸들링, 에러는 더 직관적으로 처리할 수 있게 되는데, throw와 try를 활용해서 에러를 처리할 수 이쎅 된다.
 3. 코드 구조 > 비동기 처리하는 함수들이 나뉘어지게 된다. 하나의 단일화된 함수로 구분이 되면서 코드는 쉽게 나뉘고 구분 된다. 깔끔하고 유지 관리하기 쉬운 코드로 정리가 된다는 점!
 4. Debugging > 비동기 코드는 디버그하기 복잡하지만 기존 디버깅 방식에서 벗어난다. breakpoint를 활용해서 동기처리하는 함수처럼 관리할 수 있게 된다는 점.
 
 
 async await는 synchronous 코드처럼 관리하고 처리할 수 있게 된다는 점이 있다.
 async await는 nested closure와 callback 함수의 필요가 없어진다. > 더불어 pyramid of doom도 피할 수 있게 된다!
 
 ++ after understanding a bit, the synchronous function is unable to call async functions directly
 +++ 만일 동기, 비동기 함수가 동시에 존재하고 호출하는 방식이 같다고 가정할 경우, Swift는 문맥상 일치하는 메서드를 호출하게 된다. 호출 시점이 async가 필요할 경우 Swift는 비동기 함수를 호출할 것이며 아닐 경우 synchronous 함수를 호출하게 된다.
 */


// Do Try Catch, async Throws, throw
/*
 Do Catch 블럭은 비동기 처리 함수를 활용하는데 있어서 발생할 수 있는 데이터 또는 오류를 '잡아서' 처리하는 과정에서 사용한다.
 func updateData() {
 do { }
 catch { }
 }
 
 throws와 throw는 **오류가 발생할 경우** 사용하게 된다.
 말그대로 오류를 던지는 과정인데, 비동기 처리가 필요한 메서드가 오류를 발생하거나 오류를 처리해야하는 경우 사용하면 된다.
 func save(users: [String]) async throws -> String {
 let savedUsers = users.joined(separators: ",")
 if savedUsers.count > 32 }{
 throw UserError.dataTooLong
 }
 }
 
 위처럼 save 메서드 내부에서는 비동기로 처리하는 데이터를 받아야 하는 시점이 있다.
 오류가 발생하면 해당 오류를 던지게 될 것이고 처리 시점에서는 throw를 활용헤서 발생한 오류를 대응하는데 활용된다.
 */

//MARK: - Async let

struct Dog: Codable {
    let message: String
    let status: String
    
    var id: String { message }
    var url: URL { URL(string: message)! }
}

func fetchDogData() async throws -> Dog {
    let dogUrl = URL(string: "https://dog.ceo/api/breeds/image/random")!
    let (data, response) = try await URLSession.shared.data(from: dogUrl) //tuple로 생성되는 이유, the return value of the data is Data, URLResponse
    return try JSONDecoder().decode(Dog.self, from: data)
}

func fetchDogImage() async throws -> Data {
    let url = try await fetchDogData().url
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

// MARK: - run multiple Async jobs using 'let'
func fetchThreeDogs() async throws -> [Dog] {
    // 여기서 await를 활용하지 않아도 된다. 함수가 종료되는 시점에서 await를 활용하게 되면서
    async let firstDog = fetchDogData()
    async let secondDog = fetchDogData()
    async let thirdDog = fetchDogData()
    
    return try await [firstDog, secondDog, thirdDog]
}

// 아래 함수가 실행되지 않는 이유는 fetchAllDogs 자체가 synchronous이기 때문
//func fetchAllDogs() -> Dog {
//    do {
//        return try fetchThreeDogs()
//    } catch {
//        print("에러 발생")
//    }
//}

// Task를 활용하면 synchronous function 내에서 호출되는 concurrency 문제를 해결할 수 있게 된다.
// Task runs under asynchronous actions.
// Task enables synchronous functions to be run in any asynchronous code.
Task {
    let data = try await fetchThreeDogs()
}



/* ==============================================================================================================
 MARK: - using escaping Closures
 
 - 위에서 본대로 async await 접근이 가장 올바른 접근.
 하지만 iOS 13 이전에는 escaping을 적용해야한다.
 
 동일한 async 작업을 하게 되지만 escaping의 문제점은
 1. 읽기 어렵고 이해하기 시간이 걸리는 점
 2. async는 단일 result 값이 반환되는 반면, completion closure은 여러번 호출되거나 호출이 아예 안될 가능성이 존재한다.
 3. Swift concurrency uses a cooperative thread pool behind the scenes, avoiding thread explosion and excessive context switching. This is done transparently, so developers do not need to worry about threading.
 
 Swift Concurrency 이전에는 completion Closure을 활용해서 데이터에 대한 응답, 결과값을 처리했다.
 */

struct HTTPError: Error {
    let statusCode: Int
}

func fetchDog(completion: @escaping (Result<Dog, Error>) -> Void) {
    let dogURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
    let task = URLSession.shared.dataTask(with: dogURL) { data, response, error in
        if let error = error {
            completion(.failure(error))
        }
        
        if let newResponse = response as? HTTPURLResponse, newResponse.statusCode != 200 {
            completion(.failure(HTTPError(statusCode: newResponse.statusCode)))
        }
        
        guard let data = data else {
            completion(.failure(error!))
            return
        }
        
        do {
            let dog = try JSONDecoder().decode(Dog.self, from: data)
            completion(.success(dog))
        } catch {
            completion(.failure(error))
        }
    }
    task.resume()
}



// 참고
// - https://medium.com/@hyleedevelop/ios-swift-async-await-and-closure-for-asynchronous-programming-in-swift-39c2bb1a092e
// - https://matteomanferdini.com/swift-async-await/

