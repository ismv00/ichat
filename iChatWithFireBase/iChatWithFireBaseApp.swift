//
//  iChatWithFireBaseApp.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 21/02/23.
//

import SwiftUI
import Firebase

@main
struct iChatWithFireBaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
