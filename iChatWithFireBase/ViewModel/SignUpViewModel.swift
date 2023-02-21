//
//  SignUpViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 21/02/23.
//

import Foundation


class SignUpViewModel : ObservableObject {
    var name = ""
    var email = ""
    var password = ""
    
    func signUp() {
        print("Nome: \(name), email: \(email), password: \(password)")
    }
}
