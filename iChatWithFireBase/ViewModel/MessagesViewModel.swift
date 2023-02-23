//
//  MessagesViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 22/02/23.
//

import Foundation
import FirebaseAuth

class MessagesViewModel : ObservableObject {
    func logout() {
        try? Auth.auth().signOut()
    }
}
