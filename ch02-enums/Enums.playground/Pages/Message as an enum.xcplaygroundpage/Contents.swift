//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Message as an enum

import Foundation

enum Message {
    case text(userId: String, contents: String, date: Date)
    case balloon(userId: String, date: Date) // 여기는 왜 이미지가 없지? > 어떤 이미지가 보내질지를 선택할 수 있지 않나?
    case draft(userId: String, date: Date) // 여기는 왜 boolean 값을 받지 않지?
    case join(userId: String, date: Date)
    case leave(userId: String, date: Date)
    // 각 객체들이 신경써야 하는 데이터는 join은 참여 일정만 알면 될뿐, 그 이상은 알 필요가 없다는 거구나
}

let textMessage = Message.text(userId: "1", contents: "안녕?", date: Date())
let joinMessage = Message.join(userId: "1", date: Date())

// 메시지 전체의 값을 일일히 확인할 수 있도록 전달이 가능
func logMessage(message: Message) {
    switch message {
    case let .text(userId: id, contents: contents, date: date): print("[\(date)] User \(id) sends message \(contents)")
    case let .draft(userId: id, date: date): print("[\(date)] User\(id) is drafting message")
    case let .join(userId: id, date: date): print("[\(date)] User\(id) is joining a message")
    case let .leave(userId: id, date: date): print("[\(date)] User \(id) has left the message")
    case let .balloon(userId: id, date: date): print("[\(date)] User\(id) is sending a balloon")
    }
}

logMessage(message: joinMessage) // User 1 has joined the chatroom
logMessage(message: textMessage) // User 1 sends message: 안녕?

/// Matching single case
// 동일한 타입인 친구만 값을 확인할 수 있다.
if case let Message.join(userId: _, date: date) = joinMessage {
    print("\(date)에 메시지가 보내졌습니다.")
}

// 다르다면 값을 확인할 수 없다!
if case let Message.draft(userId: id, date: date) = joinMessage {
    print("\(id)로 부터 메시지를 받았습니다.")
}

// 모든 값을 확인하기 싫다면 wildCard를 사용하는 것
if case let Message.text(_, contents: contents, _) = textMessage {
    print("Received: \(contents)") // 안녕?
}

if case let Message.balloon(_, date: date) = joinMessage {
    print("이렇게 해서도 나오나요? \(date)")
}


// MARK: -  Questions
/*
 1. How are the messages able to iterate between the texts from different messages?
 2. From my understanding, Enums value over Structs as they allow developers to create instances and objects without the need to FILL in every detail. + Developer won't have hard time understanding the instance types. ++ can find error messages during compile time. >> what else am I missing?
 3. How are enums an "or"? >> although vague, I did understand how structs enable the instance to be "either" an instance of A or B - as they contain multiple data within the instance, the developer can't be sure which type it would be instantiated into during RUNTIME.
 
 
 // MARK: -  Understanding
 - using an enum would fit best when there is a type of category I could find or use.
 for instance, when checking if the message has been read? or sent? -> these are a specific condition of a message that categorizes the object.
 + when I need to have a function embeded within the model. 
 */
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

