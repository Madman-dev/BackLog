import Foundation

//protocol FlavorType {
//    func addFlavor()
//}
//
//extension FlavorType {
//    func addFlavor() {
//        print("소금을 더합니다!")
//    }
//}
//
//struct Coffee: FlavorType {
//    func addFlavor() {
//        print("설탕을 더합니다!")
//    }
//}
//
//
//let tastyCoffee: Coffee = Coffee()
//tastyCoffee.addFlavor()
//
//let nastyCoffee: FlavorType = tastyCoffee
//nastyCoffee.addFlavor()



protocol FlavorType{
    func addFlavor() // 프로토콜을 유지하면 동일한 값이 나오고 - 끄면 다른 값이 나온다. > runtime method dispatch!
}
extension FlavorType {
    func addFlavor() {
        print("소금!")
    }
}
struct Coffee: FlavorType {
    func addFlavor() {
        print("코코아")
    }
}
let tastyCoffee: Coffee = Coffee() // 커피 타입
tastyCoffee.addFlavor()
let grossCoffee: FlavorType = tastyCoffee // Flavor 타입?
grossCoffee.addFlavor()


// variable의 타입은 런타임에 어떤 메서드를 실행할지 결정한다고 한다. 어플이 실행되고 해당 객체에서 실행할 메서드가 결정되기 때문에 초기에 타입을 선언했음에도 불구하고 다른 값이 나오지 않는 이유가 존재하는 것.

//MARK: - LoD Practice

///// Wrong Approach
//class Market {
////    func addToCard(item: Any) {
////
////    }
//
//    func finishOrder(client: Client) {
//        let amount = 123
//
//        getMoney(client: client, amount: amount)
//    }
//
//    private func getMoney(client: Client, amount: Int) {
//        if client.getWallet().getMoney(amount: amount) {
//
//        }
//    }
//}
//
//class Client {
//    private var wallet: Wallet
//
//    init(wallet: Wallet) {
//        self.wallet = wallet
//    }
//
//    func getWallet() -> Wallet {
//        return wallet
//    }
//}
//
//class Wallet {
//    private var totalValue: Int
//
//    init(amount: Int) {
//        self.totalValue = amount
//    }
//
//    func getMoney(amount: Int) -> Bool {
//        if amount < 0 {
//            return false
//        }
//
//        self.totalValue -= amount
//        return true
//    }
//}

/// Best Practice?
//class SuperMarket {
//    func finishOrder2(person: Person) {
//        let amounts = 123
//        getMoney(person: person, amount: amounts)
//    }
//
//    private func getMoney(person: Person, amount: Int) {
//        if person.getMoney(amount: amount) {
//
//        }
//    }
//}
//
//class Person {
//    private var wallets: Pocket
//
//    init(wallets: Pocket) {
//        self.wallets = wallets
//    }
//
//    func getMoney(amount: Int) -> Bool {
//        if wallets.checkMoney(value: amount) {
//            return wallets.getMoney(value: amount)
//        }
//
//        return false
//    }
//}
//
//class Pocket {
//    private var dough: Int
//
//    init(dough: Int) {
//        self.dough = dough
//    }
//
//    func checkMoney(value: Int) -> Bool {
//        return self.dough >= value
//    }
//
//    func getMoney(value: Int) -> Bool {
//        if value < 0 {
//            return false
//        }
//
//        self.dough -= value
//        return true
//    }
//}

/// BEST PRACTICE
protocol WalletInterface {
    func getMoney(amount: Int) -> Bool
    func hasEnough(amount: Int) -> Bool
}

class SuperMarket {
    func addItem(items: Any) {
        
    }
    
    func finishedOrder(wallet: WalletInterface) {
        let amount = 123
        getMoney(wallet: wallet, pay: amount)
    }
    
    private func getMoney(wallet: WalletInterface, pay price: Int) {
        if wallet.hasEnough(amount: price) {
            
        }
    }
}

class Client {
    private var wallet: WalletInterface
    
    init(wallet: WalletInterface) {
        self.wallet = wallet
    }
    
    func getWallet() -> WalletInterface {
        return wallet
    }
}

class Wallet: WalletInterface {
    private var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func getMoney(amount: Int) -> Bool {
        if amount < 0 {
            print("돈이 부족합니다.")
            return false
        } else {
            self.amount -= amount
            return true
        }
    }
    
    func hasEnough(amount: Int) -> Bool {
            return self.amount >= amount
    }
}
