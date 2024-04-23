//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # An invalid Message

import Foundation

struct Message {
    let userId: String
    let contents: String?
    let date: Date
    
    let hasJoined: Bool
    let hasLeft: Bool
    
    let isBeingDrafted: Bool
    let isSendingBalloons: Bool
}

//: This message has invalid state. Can't have both "hasJoined" and "hasLeft".

let brokenMessage = Message(userId: "1",
                            contents: "Hi there", // We have text to show
    date: Date(),
    hasJoined: true, // But this message also signals a joining state
    hasLeft: true, // ... and a leaving state
    isBeingDrafted: false,
    isSendingBalloons: false)

// chatroom.sendMessage(brokenMessage)

//MARK: - Notes
/*
 처음에는 무슨 의미인가 했지만 읽을수록 이해가 된다.
 데이터는 1이거나 2다. 1과 2가 될 수 있는 값을 가진다는 점 자체가 에러를 만들어 낼 수 있다는 점은 생각하지 못했다.
 
 모델링을 할 때 상호 베타적인 프로퍼티들을 발견하라고 한다.
 Balloon을 보내면서 draft writing을 할 수 없듯이 동시에 A이면서 B인 상태를 가질 수 없기에!
 
 반대로 "or"의 관점을 가질 수 있는데, 이는 명확하게 
 */
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
