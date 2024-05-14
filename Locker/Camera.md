# Configuring Camera

> ## 카메라 단순 구현해보기(영상 촬영)

### 🥚 Breakdown
1. 가장 쉽게 구현할 수 있는 방법은 UIImagePicker
2. AVCaptureSession을 사용하면 조금 더 커스터마이징 가능

### 🐣 생각 정리
애초에 모든게 다 복잡한 상황인데, 공식문서를 읽으면서 구현해보려고 했을 때 마주하는 문제가 있었다.
1. 공식문서에서 보여주는 예시는 최신 기술일 가능성이 높음<br>
우리의 목적이 최대한 많은 사람들이 사용할 수 있도록 만들어보자였던만큼 공식문서만 파면 좋지 않을 것 같다.
2. 이해 자체가 안된다.<br>
카메라를 활용해보려고 하는 시도 자체가 처음이다보니 찾아봐야하는 기술들이 매우 많았다.<br>
하나하나씩 공부해보면서 접근하고 있지만, 주어진 시간 내에 구현을 하라고 했을 때 완전히 이해를 하면서 구현할 수는 없어 보인다.<br><br>

➡ **결론은 일단 빨리 뭐든 만들어보자.**<br>
단, UIImagePicker는 간편하게 구현이 가능하다고 하지만, 우리의 서비스 특성상 변동이 될 가능성이 높아보인다. 커스터마이징을 할 수 있는 AVCaptureSession을 중점으로 만들어보기로 결심.

### 👀 구현 이후
단순 구현이라면 어떤 흐름을 가지는 조금은 이해가 되는 것 같았다.<br>
#### BUT<br>

1. 이해하기 어려웠던 부분은 PreviewLayer을 따로 생성해야하는 부분이었는데, camera Service와 preview를 분리하기 위해 노력했지만 생각했던 것과는 달리 안됐다는 점.
2. Info.plist에서 permission key를 설정해야했다. 카메라를 활성화하기 위해 필수적

## 🐔 접근 시도
NEED TO UPDATE
<br><br>


## 🐔 공부 정리
### 1. AVCaptureSession [[링크]](https://developer.apple.com/documentation/avfoundation/avcapturesession)
#### 생성만 하면 바로 카메라 기능을 구현할 수 있는 줄 알았지만, 카메라에 있는 뷰파인더처럼 화면을 구현해야 했다. 이 기능에 대한 대한 이해도가 부족했다!
```swift
//MARK: - AVCaptureSession
let session = AVCaptureSession()
guard let device = AVCaptureDevice.default(for: .video) else { return }

do {
    let input = try AVCaptureDeviceInput(device: device)
    // 어떠한 상황으로 인해 input을 더할 수 없는 경우도 존재하기에 확인을 거쳐야 함
    if session.canAddInput(input) {
        session.addInput(input)
    }
}
```

- 영상, 음향 관련해서 설정을 변경할 수 있고 데이터를 기기(input)에서 아웃풋으로 전달하는 역할을 맡았다고 한다.
- 해당 capture session을 먼저 생성해야 이후 어떤 데이터를 받을지 처리할 수 있다.
- whiteBalanceMode, FocusMode, ExposureMode 등을 활용 가능
- 이미지 퀄리티를 지정할 수 있는데, 기본 설정은 high로 되어 있다.
    ```swift
    // 이렇게 사용하고자 하는 quality를 설정할 수 있다.
    session.sessionPreset = .photo
    session.sessionPreset = .hd4K3840x2160
    ```

AVCaptureSession 객체를 생성해야지만 input과 output을 처리할 수 있게 된다. 없다면 디바이스에서 촬영하는 영상, 녹음 파일을 처리할 허브가 없는 셈.<br>
더불어 captureSession을 활성화하기 위해선 startRunning() 메서드를,
활성화를 종료하기 위해선 stopRunning()을 실행해야한다.<br>
해당 메서드를 호출해야지만 input 데이터가 output으로 이동이되는 흐름을 만든다고!<br>
**startRunning()은 동기 메서드로 session이 시작하기 직전 또는 충돌이 나기 전까지 스레드를 막는다*
<br><br>

### 2. UIIImagePickerController [[링크]](https://developer.apple.com/documentation/uikit/uiimagepickercontroller)

- 내가 이해하기로는 카메라로 찍을 데이터의 기본 값 등을 정리할 수 있고
카메라를 활용해 얻은 데이터를 기기(input)에서 출력 데이터(capture output)로 모으는 것으로 이해했다.
- sourceType에서 library, album을 제공하고 있는 것을 보니 ImagePicker로 촬영한 결과물을 바로 볼 수 있는 것 같다.

### 3. AVCaptureVideoPreviewLayer
뷰파인더처럼 카메라로 촬영하고 있는 데이터 (input)을 눈으로 보기 위해선 AVCaptureVideoPreviewLayer를 적용해야한다.
session이 실행 중일 때 계속해서 카메라가 전달하는 데이터를 받아 출력 시킨다.

Core Animation Layer으로 변형을 줄 수 있는데, 가장 쉬운 방법은 UIView를 활용해 해당 layer을 만드는 것이라고 한다.
