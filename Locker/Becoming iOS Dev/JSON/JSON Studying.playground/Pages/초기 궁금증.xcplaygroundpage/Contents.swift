//: [Previous](@previous)

/*
json으로는 값을 가져올 수 없기 때문에 data형식으로 타입을 바꿔야 한다.

 JSONSerialization > 이건 어떤 차이점을 가지게 되는걸까?
*/

let json =
"""
[
    {
        "name": "Banana",
        "points": 200,
        "description": "Banana는 대한민국의 수출품이다."
    },
    {
        "name": "Coffee",
        "description": "우리 필수품"
    }
]
""".data(using: .utf8)!

//let jsonObject = try? JSONSerialization.jsonObject(with: json)
let jsonObject = try? JSONSerialization.jsonObject(with: json) as? [[String: Any]]

//jsonObject?.first
//jsonObject?[1]
jsonObject?.first?["name"]
jsonObject


//: [Next](@next)
