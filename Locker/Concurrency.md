# Concurrency
### Enabling to do multiple things at once

## Background
- clock speed was the maximum amount of work per CPU cycle
- Higher clock speed was limited with heat, physical inabilities
- Later processor cores were added to chips leading to increased cycle counts
    > increase in cycles lead to the thought of multithreading for efficiency.

<img src="./imageAssets/Concurrency/concurrency-vs-parallelism.avif">

It is an illusion of having multiple things happening at once, when in reality - they are switching really really FAST.

**Threads**
low level constructs that need manual management
[Apple Thread Management](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/CreatingThreads/CreatingThreads.html)

## GCD (Grand Central Dispatch)
비동기적 일처리를 위해 Swift가 접목한 기술이 GCD.<br>
GCD는 스레드 관리 코드를 추상화하고 시스템/IDE가 스스로 처리하도록 정리를 한다.<br>
알맞는 DispatchQueue에 필요한 형식을 호출할 수 있도록 간단한 API를 제공할 뿐.
<br/><br/>
main은 serial Queue로 되어 있기에 UI를 업데이트를 하는 스레드가 main인 셈<br>
반대로 global의 경우 concurrent thread Pool이기에 어떤 우선순위를 가지는지에 따라 다르게 설정할 수 있음<br>

### 1. Serial Queue / main Thread
```swift
let queue = DispatchQueue(label: "serial Queue")

queue.async {
    // first task to execute
}

queue.async {
    // second task to execute
}
```
- 가장 높은 우선순위를 가짐
- 작업들은 순서대로 실행이 됨
- 해당 스레드 내 작업은 **100% 실행이 된다**는 것이 보장됨
- 중요하게 봐야하는 건 앱의 run loop가 블록되지 않아야 한다는 점(maintain highest framerate possible)

### 2. Concurrent Queue / global Thread
```swift
let queue = DispatchQueue(label: "Concurrent Queue", attributes: .concurrent)

queue.async {

}

queue.async {

}
```
- 작업들은 동시 다발적으로 실행이 되며 어떤 작업이 먼저 종료되는지 모름
- 우선순위를 설정할 수 있음
- runs alongside main, leaving unoccupied and ready to handle other UI events (scrolling, button tap, animating etc)

### 3. Background Queue
```swift
DispatchQeueu.global().async {
    // download

    DispatchQueue.main.asycn {
        // refresh
    }
}
```
- UI를 멈추지 않기 위해 background에서 작업을 해도되지만, 업데이트 자체는 main에 해야한다.

### Main Thread vs main Queue
Main Queue는 main thread를 관리하는데 목적을 둔 Queue이다.
Main DispatchQueue는 GLOBAL AVAILABLE SERIAL QUEUE로 main 스레드에 앱의 작업을 실행한다고 한다. 어플의 메인 스레드에 존재하기 때문에 main Queue는 어플의 주요 싱크 시점이라고 볼 수 있다.

따라서 Main Queue와 Main Thread는 동일한 의미를 전달한다고 볼 수 있다.
[DispatchQueue](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html)

## How to use

- When running on Main/UI thread, UI Events and Downloading Images the main thread will freeze. **It's because the main thread is a sequential thread.**
- When image is being downloaded, nothing can be done. UNTIL the images are all downloaded.


main will only show UI Events - background Thread will perform other tasks such as download.
```swift
DispatchQueue.global().async {
    let _ = try? Data(contentOf: imageURL)

    DispatchQueue.main.async {
        // update UI

    }
}
```


Two types of Concurrency, Main and global.

User interactive - animation, event handling, updating user interface<br>
User initiative - prevent user from actively using the app<br>
Default - priority<br>
Utility - task user does not take actively (does not need to follow)<br>
Background - updating things in background<br>
unspecified - no quality specification<br>
