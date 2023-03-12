//
//  ChatViewModel.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 25/02/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
      
    @Published var text = ""
    
    var myName = ""
    var myPhoto = ""
    
    func onAppear(contact: Contacts) {
        let fromId = Auth.auth().currentUser!.uid
        
        Firestore.firestore().collection("users")
            .document(fromId)
            .getDocument { snapshot, error in
                if let error = error {
                    print("ERROR: fetching documents \(error)")
                }
                
                if let document = snapshot?.data() {
                    self.myName = document["name"] as! String
                    self.myPhoto = document["profileUrl"] as! String
                }
            }
        
        Firestore.firestore().collection("conversations")
            .document(fromId)
            .collection(contact.uuid)
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("ERROR: Fetching documents \(error)")
                    return
                }
                if let changes = querySnapshot?.documentChanges {
                    for doc in changes {
                        let document = doc.document
                        print("Document is : \(document.documentID) \(document.data())")
                        
                        let message = Message(uuid: document.documentID, text: document.data()["text"] as! String, isMe: fromId == document.data()["fromId"] as! String)
                        
                        self.messages.append(message)
                    }
                }
            }
    }
    
    func sendMessage(contact: Contacts ){
        let fromId = Auth.auth().currentUser!.uid
        let timestamp = Date().timeIntervalSince1970
        
        Firestore.firestore().collection("conversations")
            .document(fromId)
            .collection(contact.uuid)
            .addDocument(data: [
                "text": text,
                "fromId": fromId,
                "toId" : contact.uuid,
                "timestamp": UInt(timestamp)
            ]) {err in
                if err != nil {
                    print("ERROR: \(err?.localizedDescription)")
                    return
                }
                Firestore.firestore().collection("last-messages")
                    .document(fromId)
                    .collection("contacts")
                    .document(contact.uuid)
                    .setData([
                        "uuid": contact.uuid,
                        "username": contact.name,
                        "photoUrl": contact.profileUrl,
                        "timestamp": UInt(timestamp),
                        "lastMessage": self.text
                    ])
            }
        
        Firestore.firestore().collection("conversations")
            .document(contact.uuid)
            .collection(fromId)
            .addDocument(data: [
                "text": text,
                "fromId": fromId,
                "toId" : contact.uuid,
                "timestamp": UInt(timestamp)
            ]) {err in
                if err != nil {
                    print("ERROR: \(err?.localizedDescription)")
                    return
                }
                
                Firestore.firestore().collection("last-messages")
                    .document(contact.uuid)
                    .collection("contacts")
                    .document(fromId)
                    .setData([
                        "uuid": fromId,
                        "username": self.myName,
                        "photoUrl": self.myPhoto,
                        "timestamp": UInt(timestamp),
                        "lastMessage": self.text
                    ])
            }
    }
}
