//
//  SignUpViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 21/02/23.
//

import Foundation
import FirebaseAuth


class SignUpViewModel : ObservableObject {
    var name = ""
    var email = ""
    var password = ""
    
    @Published var formInvalid = false
    
    @Published var isLoading = false
    
    var alertText = ""
    
    func signUp() {
        print("Nome: \(name), email: \(email), password: \(password)")
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            
            print("usuario criado \(user.uid)")
        }
    }
}
