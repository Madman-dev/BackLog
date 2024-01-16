//: [Previous](@previous)

import Foundation

//MARK: - Allen

struct Student {
    let name: String
    var testScore: Int
}

let students = [Student(name: "Jack", testScore: 80),
                Student(name: "Steve", testScore: 86),
                Student(name: "Amy", testScore: 93),
                Student(name: "Luke", testScore: 74),
                Student(name: "Vader", testScore: 50),
                Student(name: "Mia", testScore: 68)]

var topStudentFilter: (Student) -> Bool = { student in
    return student.testScore > 80
}

func topStudentFilter(student: Student) -> Bool {
    return student.testScore > 70
}

let topStudents = students.filter(topStudentFilter)
let studentRanking = topStudents.sorted {// student1, student2 in
    $0.testScore > $1.testScore }

//for topStudent in topStudents {
//    print(topStudent.name)
//}



let names = ["Arron" ,"Chris", "Ewa", "Daniella", "Alex", "Barry"]
//print(names.sorted())

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2      // 여기서 '>'는 true일 경우, s2보다 늦게 등장해라를 의미한다.
                        // '>' 일때 backward되는 이유는 하나씩 대조하면서 새로운 sorted array에 담기 때문
                        // 'Arron'과 'chris'를 대조했는데, s1이 > s2보다 크니까 (true) 넌 나중에 등장해라! 이런 의미로 backward가 된다
}

var whatHappens = names.sorted(by: backward)
print(whatHappens)


let digitNames = [
0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let stringNumbers = numbers.map{ (number) -> String in
    var number = number
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

//digitNames[5]


//: [Next](@next)
