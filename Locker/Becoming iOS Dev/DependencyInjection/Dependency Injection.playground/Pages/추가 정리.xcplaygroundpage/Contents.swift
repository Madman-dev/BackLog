/*
 기본 개념에서 beforeInjection 부분에서 클래스로 Property 타입을 정리하면 의존성을 분리한 것처럼 보이지만, 실질적으로 분리되지 않는다.
 결국 프로퍼티가 가지고 있는 타입이 다른 클래스를 참조하고 있기 때문! 아래처럼 프로토콜를 활용하면 완전히 분리를 할 수 있게 된다.
 */

protocol Parts {
    var name: String { get }
}

class Device {
    var part: Parts
    
    init(subpart: Parts) {
        self.part = subpart
    }
    
    func printName() {
        print("우리 키보드는 \(part.name)이다.")
    }
}

class KeyBoard: Parts {
    var name: String = "키보드"
}

class Display: Parts {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// 확장성 - Extension wise
let macKey = KeyBoard()
let winKey = KeyBoard()
macKey.name = "맥 키보드"
winKey.name = "윈도우 키보드"

let macDevice = Device(subpart: macKey)
macDevice.printName()

let windowDevice = Device(subpart: winKey)
windowDevice.printName()

let dellMonitor = Display(name: "델 말고 LG 모니터")
let displayDevice = Device(subpart: dellMonitor)

displayDevice.printName()
