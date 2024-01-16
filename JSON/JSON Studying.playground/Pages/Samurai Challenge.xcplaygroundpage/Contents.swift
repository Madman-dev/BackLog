//: [Previous](@previous)

import Foundation

let json = """
[
{
"id": "1",
 "type": "Banking",
 "name": "basic Savings",
 "amount": 929466.23,
 "createdDateTime": "2010-06-21T15:29:32Z"
},
{
"id": "2",
 "type": "Banking",
 "name": "No-fee All-in Chequing",
 "amount": 17562.44,
 "createdDateTime": "2011-06-21T15:29:32Z"
}
]
"""

enum AccountType: String, Codable {
    case Banking
    case CreditCard
    case Investment
}

struct Account: Codable {
    let id: String
    let type: AccountType
    let name: String
    let amount: Decimal
    let createdDateTime: Date
}

// Date에서 발생하는 오류 - .utf8로 decode 요청을 할 떄는 millisecond로 요청하고 있었던 점
//let jsonData = json.data(using: .utf8)!
//let result = try! JSONDecoder().decode([Account].self, from: jsonData)

let jsonData = json.data(using: .utf8)!
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
let result = try! decoder.decode([Account].self, from: jsonData)


//: [Next](@next)
