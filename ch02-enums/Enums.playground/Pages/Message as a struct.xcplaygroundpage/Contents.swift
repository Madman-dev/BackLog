//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Message as a struct

import Foundation

//MARK: - Notes
/*
 //struct testMessage {
 //    let userID: String
 //    let content: String?
 ////    var content: String?
 //    let messageData: Date
 //
 //    let joined: Bool
 //    let hasLeft: Bool
 //
 //    let isTyping: Bool
 //    let hasAnimation: Bool
 //}

 메시지를 받는다고 하면 데이터 모델링은 구조체를 사용했을 것.
 ~~데이터를 구조체로 생성할 경우, 어떤 프로퍼티의 값이 빌 경우 문제가 발생한다.~~
 
 - 어플리케이션 비즈니스에서 1 또는 2가 될 수 있는 상황은 존재할 수 없다고 한다.
 - 구조체로 데이터 모델링을 한다면 생성되는 메시지는 bool이 무엇을 설정하는지에 따라 값이 다 다를 수 있다는 점을 설명한다.
 */

struct Message {
    let userId: String
    let contents: String?
    let date: Date
    
    let hasJoined: Bool
    let hasLeft: Bool
    
    let isBeingDrafted: Bool
    let isSendingBalloons: Bool
}

let joinMessage = Message(userId: "1",
                          contents: nil,
                          date: Date(),
                          hasJoined: true, // We set the joined boolean
    hasLeft: false,
    isBeingDrafted: false,
    isSendingBalloons: false)


let textMessage = Message(userId: "2",
                          contents: "Hey everyone!", // We pass a message
    date: Date(),
    hasJoined: false,
    hasLeft: false,
    isBeingDrafted: false,
    isSendingBalloons: false)

// chatroom.sendMessage(joinMessage)
// chatroom.sendMessage(textMessage)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

