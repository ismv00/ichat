//
//  ContactsViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 25/02/23.
//

import Foundation
import FirebaseFirestore

class ContactsViewModel: ObservableObject {
    @Published var contacts: [Contacts] = []
    @Published var isLoading = false
    
    var isLoaded = false
    
    func getContacts() {
        if isLoaded { return }
        isLoading = true
        self.isLoaded = true
        Firestore.firestore().collection("users")
            .getDocuments { querySnapshot, error in
                if let error = error {
                    print("ERRO AO BUSCAR CONTATOS : \(error)")
                    return
                }
                
                for document in querySnapshot!.documents {
                    print("ID \(document.documentID) \(document.data())")
                    self.contacts.append(Contacts(uuid: document.documentID,
                                             name: document.data()["name"] as! String,
                                             profileUrl: document.data()["profileUrl"] as! String))
                }
                self.isLoading = false
            }
    }
}
