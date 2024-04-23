import Foundation

struct Score1 {
    var myScore = 0
    var yourScore = 0
    
    func presentScore() {
        print(myScore, yourScore)
    }
}

var score1 = Score1()
score1.myScore = 100
score1.presentScore()


class Score2 {
    var myScore: Int
    var yourScore: Int
    
    init(myScore: Int, yourScore: Int) {
        self.myScore = myScore
        self.yourScore = yourScore
    }

    func presentScore() {
        print(myScore, yourScore)
    }
}

var score2 = Score2(myScore: 0, yourScore: 0)
score2.yourScore = 50
score2.presentScore()



class Person {
    static var money = 100
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

print(Person.money)

