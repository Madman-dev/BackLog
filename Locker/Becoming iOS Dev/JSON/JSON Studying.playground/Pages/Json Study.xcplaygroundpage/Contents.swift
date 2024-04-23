
import Foundation

// MARK: - Inflearn
let json =
"""
[
    {
        "name": "Banana",
        "price": 2000,
        "description": "국산에서 자란 바나나입니다."
    },
    {
        "name": "chicken",
        "price": 30000
    }
]
""".data(using: .utf8)! // utf8, utf16에 따라 바이트 수가 다르다.

// 하나의 타입으로 지정할 경우 nil이 반환된다. 따라서 Any로 모든 타입을 통용하도록 설정
let jsonObj = try? JSONSerialization.jsonObject(with: json) as? [[String: Any]]

// entering into values within Dictionary
jsonObj?.count
jsonObj?.first
jsonObj?[1]
// jsonObj?[2] > out of bounds error

jsonObj?.first?["price"] // 2,000
jsonObj?.first?["Banana"] // nil


// MARK: - Parsing a type

let singleString = """
"Data가 있나요?"
""".data(using: .utf8)!
let parsingUnable = try? JSONSerialization.jsonObject(with: singleString)

/*
 ⭐️ Why isn't the singleString able to parse? compared to jsonObj?
 JSON 규격에 대해 생각해보는게 좋다.
 JSON == Array or Dictionary formatted data.
 
 Unable to parse as the data doesn't match the given format. (single String)
 */

// fragment allowed enables data to turn even if type doesn't match collection or an array.
let parsingAble = try? JSONSerialization.jsonObject(with: singleString, options: .fragmentsAllowed) as? String
type(of: parsingAble)   // we can check the parsingAble object is indeed String


/// Array, Dictionary에서 접근 확인 (index double check), 하드 코딩일 경우 오타 확인, 타입 캐스팅되었는지 확인 등
/// 여러모로 데이터를 호출하는데 방해하는 영역이 많이 존재한다.

//MARK: - Codable

struct Fruit: Decodable {
    let name: String
    let price: Int
    let description: String?
}

// 배열에 담는 이유는 Json은 multiple fruits를 담고 있는 타입이기 떄문 - 아래 코드는 왜 nil을 반환하는가?
//let fruit = try? JSONDecoder().decode([Fruit].self, from: json)

do {
    let fruit = try JSONDecoder().decode([Fruit].self, from: json)
    fruit[0].description
    fruit[0].name
} catch {
    print(error)    // 🚨 we see that 2nd data within Json doesn't have "price" - DOES NOT MATCH CRITERIA of struct Fruit
}


/*
 궁금증
 
 1. What is fragmentsAllowed?
 2. Decodable, Codable의 차이
*/
