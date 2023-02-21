//
//  SignInViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 21/02/23.
//

import Foundation

//MARK: CRIANDO MINHA CLASSE E INFORMANDO QUE ELA É UM OBJETO OBSERVAVÉL
class SignInViewModel : ObservableObject {
    var email = ""
    var password = ""
    
    func signIn() {
        print("email: \(email), senha: \(password)")
    }
}
