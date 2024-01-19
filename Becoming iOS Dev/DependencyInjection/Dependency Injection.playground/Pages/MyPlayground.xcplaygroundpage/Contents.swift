import UIKit

// MARK: - What Causes an issue
/*
 How does a class depend on and interact with another class?
 Why does the class DEPEND on another?
 
 M 이라는 클래스가 N 클래스의 메서드 F를 활용한다고 보자
 이럴 경우 M은 N에 의존적인 상황으로 볼 수 있게 된다.
 이유는 N의 메서드 F에서 변화가 있을 경우, M에서도 N과 F의 변화를 주어야 하기 때문.
 
 
 This is what can happen when we change a single piece of code and it causes errors in other parts of the project.
 Not only M need to change if N changed. code that related to N which is above, will also need to change.
 */


//MARK: - Dependency Injection Principle
/*
1. High-level modules should not depend on low-level modules. Both should depend on abstrations.
    - M and N is both high-level module. Thus, M and N should not have any dependency according to DIP.
    - Mostly introduced as Interface, protocol - through abstraction, it helps avoid cascading changes as one no longer depends directly to another.
 
2. Abstractions should not depend on details. Details should depend on abstractions.

 ➡ 이미 잘 알고 있듯이, Dependency Injection은 클래스를 분리(decoupling)하거나 코드를 유연하게 만들 수 있는 방법인 셈.
 */


class M {
    
}

class N {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printName() {
        print(self.name)
    } 
}
