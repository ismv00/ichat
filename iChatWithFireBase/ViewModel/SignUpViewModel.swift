//
//  SignUpViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 21/02/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import UIKit


class SignUpViewModel : ObservableObject {
    var name = ""
    var email = ""
    var password = ""
    @Published var image = UIImage()
    
    @Published var formInvalid = false
    
    @Published var isLoading = false
    
    var alertText = ""
    
    func signUp() {
        print("Nome: \(name), email: \(email), password: \(password)")
        
        if(image.size.width <= 0) {
            formInvalid = true
            alertText = "Selecione uma foto"
            return
        }
        
        isLoading = true
        
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
            
            self.uploadPhoto()
        }
    }
    private func uploadPhoto() {
        let filename = UUID().uuidString
        
        guard let data = image.jpegData(compressionQuality: 0.2) else { return }
        
        let newMetadata = StorageMetadata()
        newMetadata.contentType = "image/jpeg"
        
        let ref = Storage.storage().reference(withPath: "/images/\(filename).jpg")
        
        ref.putData(data, metadata: newMetadata) { metadata, err in
            ref.downloadURL {url, error in
                self.isLoading = false
                print("foto criada \(url)")
            }
        }
    }
}
