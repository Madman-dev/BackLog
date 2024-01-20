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

// before injection
class CreditCardMethod {
    func processPayment(amount: Double) {
        print("\(amount) 비용이 발생합니다.")
    }
}

class PaypalMethod {
    func processPayment(amount: Double) {
        print("\(amount) 비용이 발생합니다.")
    }
}

class PaymentProcessor {
    let creditCard: CreditCardMethod
    let paypal: PaypalMethod
    
    init() {
        self.creditCard = CreditCardMethod()
        self.paypal = PaypalMethod()
    }
    
    func processCreditCardPayment(amount: Double) {
        creditCard.processPayment(amount: amount)
    }
    
    func processPaypalPayment(amount: Double) {
        paypal.processPayment(amount: amount)
    }
}


// after injection
protocol InjectedGateway {
    func pay(amount: Double)
}

class InjectedCreditCardPayment: InjectedGateway {
    let amount: Double
    
    init(amount: Double) {
        self.amount = amount
    }
    
    func pay(amount: Double) {
        print("이제 카드로 \(amount) 비용을 지출합니다.")
    }
}

class InjectedPaypalPayment: InjectedGateway {
    func pay(amount: Double) {
        print("지금은 페이팔로 \(amount) 비용을 지출합니다.")
    }
}

// InjectedPaymentProcessor now depends on interface and protocol - high level abstraction
class InjectedPaymentProcessor {
    let payment: InjectedGateway
    
    init(paymentGateway: InjectedGateway) {
        self.payment = paymentGateway
    }
    
    func pay(amount: Double) {
        payment.pay(amount: amount)
    }
}

// 카드로 계산
let creditCard = InjectedCreditCardPayment(amount: 30)
//print(creditCard.amount)
let creditInjection = InjectedPaymentProcessor(paymentGateway: creditCard)

// 페이팔로 변경
let paypal = InjectedPaypalPayment()
let paypalInjection = InjectedPaymentProcessor(paymentGateway: paypal)
paypalInjection.pay(amount: 15)

/*
 항상 같은 흐름을 타고 있지만, 이해는 되는 것 같다.
 코드를 변형할 수 있다는 점이 어떤 점인지 이해가 간다.
 프로젝트를 할 때 프로토콜로 의존성을 분리한 경험이 있는데, 간단했기에 큰 문제 없이 잘 적용하긴 했다.
 
 하지만 명확하게 아직 이해하지 못하는 부분은 실제 프로젝트를 할 때 어떻게 분리가 될지 감이 안오기는 한다.
 느끼기로는 프로토콜과 하나의 클래스만으로 처리할 수 있는 일을 굳이 여러 클래스를 만들어서 할 필요가 없고 아름답지 못하다인데,
 제대로 사용해보면서 조금 더 이해력을 쌓아보아야겠다.
 */

// 참고: https://mrezkys.medium.com/dependency-inversion-principle-d-in-solid-theory-3ad2a409df4a
