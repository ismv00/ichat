//
//  Message.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 25/02/23.
//

import Foundation

struct Message: Hashable {
    let uuid: String
    let text: String
    let isMe: Bool
}
