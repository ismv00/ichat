//
//  ChatViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 25/02/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = [
        Message(uuid: UUID().uuidString, text: "Some Message", isMe: true),
        Message(uuid: UUID().uuidString, text: "Some teste", isMe: false),
        Message(uuid: UUID().uuidString, text: "Some afdasa", isMe: false),
        Message(uuid: UUID().uuidString, text: "Some Mesasfassage", isMe: true),
        Message(uuid: UUID().uuidString, text: "Some Messgggsssage", isMe: false),
        Message(uuid: UUID().uuidString, text: "Some fasfsass", isMe: true),
        Message(uuid: UUID().uuidString, text: "Some asasdf", isMe: false),
        Message(uuid: UUID().uuidString, text: "Some Messsssssssssage", isMe: true)
        
    ]
    @Published var text = ""
}
