import Cocoa

class Bolt {
    // 아래 프로퍼티를 변경하게 된다면 Final에서도 변화를 주어야 한다.
    var name: String = "Bolt"
}

class Nut {
    var name: String = "Nut"
}

class Final {
    /*
     현재는 코드가 Bolt에 의존적인 상황
     
     결국 코드의 확장을 해야하는 상황인데, - 의존성 주입을 통해 이룰 수 있게 된다.
     */
    
    var a = Bolt()
    
    init(a: Bolt = Bolt()) {
        self.a = a
    }
        
    func printName() {
        print(a.name)
    }
}


let boltA: Bolt = Bolt()
boltA.name = "불안전한 볼트"

// 주입이 되었다!
let final: Final = Final(a: boltA)
final.a
final.a.name
final.printName()

//MARK: - 하지만 위의 예시는 의존성 주입이 아니다.

