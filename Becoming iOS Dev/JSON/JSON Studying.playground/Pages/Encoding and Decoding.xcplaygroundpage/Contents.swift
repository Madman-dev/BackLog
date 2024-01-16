//: [Previous](@previous)

// MARK: - Hacking With Swift
import Foundation

let json = """
[
{
"name": "Jack",
"age": 31
},
{
"name": "Steve",
"age": 34
}
]
"""

// Codable이 존재하기에 Data 객체로 변환이 가능했다.
let jsonData = Data(json.utf8)

struct User: Codable {
    let name: String
    let age: Int
}

let decoder = JSONDecoder()
do {
    let decodedData = try decoder.decode([User].self, from: jsonData)
} catch {
    print("JSON파일이 decode 될 수 없었습니다.")
}

//: [Next](@next)
