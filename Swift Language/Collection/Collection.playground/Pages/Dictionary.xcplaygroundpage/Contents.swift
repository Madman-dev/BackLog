import UIKit

// 키와 값을 활용한다
// 같은 타입 + index를 가짐.

// index가 존재하지 않고 - 순서가 없다~ - key로 값을 가져온다
var student: [Int: String] = [101: "이동준", 103: "이동훈"]

var food: [String: Int] = ["망고": 2, "피망": 1, "피자": 4]
food["피자"]

food["치즈"] = 8
print(food)

food["망고"] = 4
print(food)

food.updateValue(200, forKey: "망고")
print(food)

print(student)
student[103] = "홀리"
student[102] = "이렇게?"
print(student)

student.updateValue("도리토스", forKey: 101)
print(student)
student.removeValue(forKey: 103)
print(student)


// 해시태그 관리
var hashtag: [String: Int] = ["영화 명대사": 1000, "스릴러 영화 추천": 100000, "추천 영화": 20403]

print(hashtag)
hashtag["이것도"] = 190

print(hashtag)


let heights = [
    "jack": 173,
    "steve": 180
]

// optional value, and unwrapping
print(heights["steve"])
if let heights = heights["steve"] {
    print("형의 실제 키는 \(heights)다")
}

/*
 WHY Would iOS developers require Arrays AND Dictionaries?
 
- although both are a collection of data,
 considering the arrangement of data leads to the difference.
 Arrays store data in order where as Dictionaries are only to approach data faster using keys.
 */
