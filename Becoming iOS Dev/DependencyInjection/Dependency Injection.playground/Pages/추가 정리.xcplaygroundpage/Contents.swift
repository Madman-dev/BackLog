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

let macKey = KeyBoard()
let winKey = KeyBoard()
macKey.name = "맥 키보드"
winKey.name = "윈도우 키보드"

let macDevice = Device(subpart: macKey)
macDevice.printName()

let windowDevice = Device(subpart: winKey)
windowDevice.printName()
