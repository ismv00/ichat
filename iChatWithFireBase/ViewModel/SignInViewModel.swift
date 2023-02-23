//
//  SignInViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 21/02/23.
//

import Foundation
import FirebaseAuth

//MARK: CRIANDO MINHA CLASSE E INFORMANDO QUE ELA É UM OBJETO OBSERVAVÉL
class SignInViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @Published var formInvalid = false
    
    @Published var isLoading = false
    
    var alertText = ""
    
    
    func signIn() {
        print("email: \(email), senha: \(password)")
        Auth.auth().signIn(withEmail: email, password: password) {
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("usuário logado \(user.uid)")
        }
        
    }
}
