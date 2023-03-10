//
//  MessagesView.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 22/02/23.
//

import SwiftUI

struct MessagesView: View {
    
    @StateObject var viewModel = MessagesViewModel()
    var body: some View {
        NavigationView {
            VStack{
                if viewModel.isLoading {
                    ProgressView()
                }
                List(viewModel.contacts, id: \.self) { contact in
                    NavigationLink {
                        ChatView(contact: contact)
                    } label: {
                        ContactMessageRow(contact: contact)
                    }
                }
            }
            .onAppear {
                viewModel.getContacts()
            }
            .navigationTitle("Mensagens")
            .toolbar {
                ToolbarItem(id: "contacts",
                            placement: ToolbarItemPlacement.navigationBarTrailing,
                            showsByDefault: true) {
                    NavigationLink("Contatos") {
                        ContactsView()
                    }
                }
                ToolbarItem(id: "Logout", placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true) {
                    Button("Logout") {
                        viewModel.logout()
                    }
                }
                
            }
        }

    }
}

struct ContactMessageRow: View {
    var contact: Contacts
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: contact.profileUrl)){ image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            VStack (alignment: .leading) {
                Text(contact.name)
                if let msg = contact.lastMessage {
                    Text(msg)
                }
            }
            Spacer()
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
