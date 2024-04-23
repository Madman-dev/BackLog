//: [Previous](@previous)

import Foundation

/*
 //MARK: - 객체의 책임에 대한 생각을 다르게 하고 있었다
 
 이전까지 책임에 따른 메서드를 그들의 책임으로 생각을 했었다.
 예시에 하나의 '차량' 객체를 만들었다. 생성할 경우에는 휠 구동 방식을 얻도록 했는데, run method 이외에는 아무 것도 없었다.
 차는 결국 달리기만 하면 되니까 여긴 ok.
 하지만 왼쪽으로 틀거나 오른쪽으로 가고 싶다고 메서드를 추가하게 되면 해당 객체가 가지는 책임이 run에서 늘어나게 된다.
 이건 1객체 1책임을 벗어나는 행위인데, 객체들이 책임이 많아질 수록 해당 객체를 참조하거나 따르는 코드들이 많아지면서 코드 연결성 -
 즉 응집력이 낮아진다는 의미.

 
 자동차 객체를 만들 때, 클래스 속의 값들은 줄 필요가 없다?
 실질적으로 값을 제공하는 친구들은 해당 클래스를 초기화할 객체들이기 때문!
 */

class turnLeft {
    func turnLeft() {
        print("turned left")
    }
}

class Car: turnLeft {
    var wheelCount: Int
    var storageSpace: Bool
    var maker: String
    
    init(wheelCount: Int, storageSpace: Bool, maker: String) {
        self.wheelCount = wheelCount
        self.storageSpace = storageSpace
        self.maker = maker
    }
    
    func run() {
        print("Drive Forward")
    }
}

let myCar = Car(wheelCount: 4, storageSpace: false, maker: "Benz")

//: [Next](@next)
