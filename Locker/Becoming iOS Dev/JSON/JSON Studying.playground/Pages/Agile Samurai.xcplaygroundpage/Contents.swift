//: [Previous](@previous)

// MARK: - Udemy
import Foundation

/*
 1. Codable
 2. URLSession
 3. Result
 */

let json = """
{
"id": "1",
"phone": "iPhone XS",
"name": "jack"
}
"""

struct Profile: Codable {
    let id: String
    let phone: String
    let name: String
    
}

enum NetworkOperation: Error {
    case decodingError
    case serverError
}

// fetching data for profile images
func fetchProfileImage(forUser userID: String, completion: @escaping (Result<Profile, NetworkOperation>) -> Void) {
    let url = URL(string: "https://unsplash.com/photos/city-under-cloudy-sky-eVa2FK83K6w")!
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error != nil else {
            completion(.failure(.serverError))
            return
        }
        
        do {
            let profile = try JSONDecoder().decode(Profile.self, from: data)
            completion(.success(profile))
        } catch {
            completion(.failure(.decodingError))
        }
    }.resume()
}

fetchProfileImage(forUser: "1") { result in
    switch result {
    case .success(let profile):
        print("데이터를 받을 수 있었어요", profile)
    case .failure(let error):
        print("데이터를 받는데 오류가 있었어요", error)
    }
}


//: [Next](@next)
