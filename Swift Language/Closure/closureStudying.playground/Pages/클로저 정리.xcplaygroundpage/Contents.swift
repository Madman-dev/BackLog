import Foundation

import Foundation

let globalName = "Steve"

class Person {
    let name = "jack"
    
    func mentionName() {
        let name = "Coco"
        print(name) // local variable가 name이 된다.
        print("========")
        print(self.name) // 메서드를 담고 있는 클래스 속 '동일한 이름을 가진 상수'에 접근한다.
        print("========")
        print(globalName)
    }
}

let newGuy = Person()
newGuy.name
newGuy.mentionName()


//MARK: -  weak self
class NewClass {
    var closure: (() -> Void)?
    
    init() {
        closure = { [weak self] in // when [weak self] isn't available deinit isn't called
            self?.callName()
        }
    }
    
    func callName() {
        print("가르키고 있습니다!")
    }
    
    deinit {
        print("해제 되었습니다.")
    }
}

var weakCycle: NewClass? = NewClass()
weakCycle?.closure
weakCycle?.callName()
weakCycle = nil // [weak self] 없이는 deinit이 호출되지 않는다.

/*
Q. deinit으로 메모리 해제를 확인하는 것과 LLDB와의 차이점이 있는가?
*/

