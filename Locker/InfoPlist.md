# Info.plist

Application Information PropertyList의 줄임말로 프로젝트 당 하나씩 존재하는 파일이다.
해당 파일은 Key - Value 값으로 데이터를 보유하고 있으며 번들을 파악하고 설정할 수 있도록 돕는다.

mainStoryboard file을 기본적으로 제공하고 CFBundleIdentifier 같은 데이터는 이후에 변경할 수 있도록 만들어져 있다.

### 카메라 허락
```swift
- String 타입
Privacy - Camera Usage Description
```

### 음성 허락
```swift
- String 타입
Privacy - Microphone Usage Description
```
