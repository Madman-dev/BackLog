//: [Previous](@previous)

import Foundation

/*
 Map Json keys that are completely different from Swift Properties using CodingKeys enum
 */

let json = """
[
    {
        "user_first_name": "Taylor",
        "user_last_name": "Swift",
        "user_age": 26
    }
]
"""

// The Json Data up above looks ugly.
struct User: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    
    // To make the UserData fit with the JsonData, we declare a coding Key, which will act as a map the data into UserData
    enum CodingKeys: String, CodingKey {
        case firstName = "user_first_name"
        case lastName = "user_last_name"
        case age = "user_age"
    }
}

let jsonData = Data(json.utf8)
let decoder = JSONDecoder()

do {
    let decoded = try decoder.decode([User].self, from: jsonData)
} catch {
    print("디코딩 오류 발생")
}

//: [Next](@next)
