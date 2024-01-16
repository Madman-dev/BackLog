//: [Previous](@previous)

import Foundation

let json = """
[
{
"first_name": "Jack",
"last_name": "lee"
},
{
"first_name": "Steve",
"last_name": "Ko"}
]
"""

let jsonData = Data(json.utf8)

// convention이 달라도 가능할까?
struct UserName: Decodable {
    let firstName: String
    let lastName: String
}


// convertFromSnakeCase를 통해 쉽게 바꿀 수는 있지만, lastname으로 작성하면 또 안된다!
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

do {
    let decodedData = try decoder.decode([UserName].self, from: jsonData)
} catch {
    print("데이터를 디코드할 수 없었습니다.")
}

//: [Next](@next)
