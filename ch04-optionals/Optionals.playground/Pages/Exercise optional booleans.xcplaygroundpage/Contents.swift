
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Exercise: Optional booleans

//: Given this optional Boolean
let configuration = ["audioEnabled": true]

//: Create an enum out of it so it can handle all three cases.

let audioSetting = AudioSetting(rawValue: configuration["audioEnabled"])

switch audioSetting {
case .enabled: print("Turn up the jam!")
case .disabled: print("sshh")
case .unknown: print("Ask the user for the audio setting")
}

//: Get the booelan value out of the enum again as well.

let isEnabled = audioSetting.rawValue

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
