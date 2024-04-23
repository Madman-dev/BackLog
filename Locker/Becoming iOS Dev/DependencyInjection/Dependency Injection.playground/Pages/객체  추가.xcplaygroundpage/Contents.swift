//: [Previous](@previous)

import Foundation

// higher abstraction - 메서드만 제공
protocol InjectedGateway {
    func pay(amount: Double) // 결제 금액
    var spent: Double { get } // 잔액 확인 
}

class PaymentProcessor {
    let payment: InjectedGateway
    var totalSpent: Double {
        return payment.spent
    }
    
    init(gateway: InjectedGateway) {
        self.payment = gateway
    }
    
    func processPayment(amount: Double) {
        payment.pay(amount: amount)
    }
}

// 결제 방식 1
class creditCardPayment: InjectedGateway {
    private var totalAmount: Double = 0
    var spent: Double {
        return totalAmount
    }
    
    // 초기 목돈 제공
    init(earned: Double) {
        self.totalAmount = earned
    }
    
    // 결제시 차감
    func pay(amount: Double) {
        print("지금 보유하고 있는 돈은 \(totalAmount)인데, \(amount)만큼 낼께")
        totalAmount -= amount
    }
}

// 결제 방식 2
class paypalPayment: InjectedGateway {
    private var totalAmount: Double = 0
    var spent: Double {
        return totalAmount
    }
    
    init(earned: Double) {
        self.totalAmount = earned
    }
    
    func pay(amount: Double) {
        print("지금 보유하고 있는 돈은 \(totalAmount)인데, \(amount)만큼 낼께")
        totalAmount -= amount
    }
}



// MARK: - creating individually
// private property로 변경 이후 잔액 확인 불가, 비용은 계속 지불 가능, 돈을 더할 경우 메서드 새로 생성 필요
let creditCard = creditCardPayment(earned: 100)
creditCard.pay(amount: 10) // 잔액 확인 불가


// MARK: - creating a paymentProcessor
// easy access and approach to every detail
let creditPaymentProcessor = PaymentProcessor(gateway: creditCard)
creditPaymentProcessor.processPayment(amount: 12.5)
creditPaymentProcessor.totalSpent

let paypal = paypalPayment(earned: 2000)
let paypalPaymentProcessor = PaymentProcessor(gateway: paypal)
paypalPaymentProcessor.processPayment(amount: 400)


//: [Next](@next)
