import Foundation

struct Message {
    let message: String
    let senderID: String
    let date: NSDate
}

private let ref = Firebase(url: "https://swifttindercloneios.firebaseio.com/messages")
private let dateFormat = "yyyyMMddHHmmss"

