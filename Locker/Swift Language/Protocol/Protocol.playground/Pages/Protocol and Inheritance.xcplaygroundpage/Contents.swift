//: [Previous](@previous)
import Foundation

class Employee {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func getDetails() {
        print("My name is \(name)임미다!")
    }
}

class IOSEngineer: Employee, iOSEngineerSkillSet, devOPEngineerSkillSet, backendEngineerSkillSet {//, backendEngineer >> 다중 상속 불가!
    /// extension으로 추가 구현이후 작성 안 해도 구현되는 방식으로 정리가 되었다.
//    func getLanguageExpertise() {
//        print("Swift")
//    }
    
    /// let's say the iOSDeveloper is super smart and is able to handle devOps tools as well >> however this is the same copy of the previous code - you are repeating!
//    func getDevOpsToolsExpertise() {
//        print("Jenkins, Fastlane, Bamboo")
//    }
}

class DevOpsEngineer: Employee, devOPEngineerSkillSet {
//    func getDevOpsToolsExpertise() {
//
//    }
}


class BackendEngineer: Employee, backendEngineerSkillSet {
//    func getMessagingQueueExpertise() {
//
//    }
    
    /// This time, let's say the backend Engineer is also very talented and is able to devOps as well.
}

protocol iOSEngineerSkillSet {
    func getLanguageExpertise()
}

protocol backendEngineerSkillSet {
    func getMessagingQueueExpertise()
}

protocol devOPEngineerSkillSet {
    func getDevOpsToolsExpertise()
}

extension iOSEngineerSkillSet {
    func getLanguageExpertise() {
        print("Swift")
    }
}

extension backendEngineerSkillSet {
    func getMessagingQueueExpertise() {
        print("Kafka, RabbitMQ")
    }
}

extension devOPEngineerSkillSet {
    func getDevOpsToolsExpertise() {
        print("Jenkins, Fastlane, Bamboo")
    }
}


let employee = IOSEngineer(name: "Jack")
employee.getDetails()
employee.getLanguageExpertise()
employee.getDevOpsToolsExpertise()
employee.getMessagingQueueExpertise()

//: [Next](@next)


//: [Next](@next)
