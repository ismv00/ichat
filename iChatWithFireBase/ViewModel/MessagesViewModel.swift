//
//  MessagesViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 22/02/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class MessagesViewModel : ObservableObject {
    
    @Published var isLoading = false
    @Published var contacts: [Contacts] = []
    
    func getContacts() {
        let fromId = Auth.auth().currentUser!.uid
        Firestore.firestore().collection("last-messages")
            .document(fromId)
            .collection("contacts")
            .addSnapshotListener { snapshot, error in
                if let changes = snapshot?.documentChanges {
                    for doc in changes {
                        if doc.type == .added {
                            let document = doc.document
                            
                            self.contacts.removeAll()
                            self.contacts.append(Contacts(uuid: document.documentID,
                                                          name: document.data()["username"] as! String,
                                                          profileUrl: document.data()["photoUrl"] as! String, lastMessage: document.data()["lastMessage"] as! String, timestamp: document.data()["timestamp"] as! UInt
                                                         ))
                        }
                    }
                }
            }
    }
    func logout() {
        try? Auth.auth().signOut()
    }
}
