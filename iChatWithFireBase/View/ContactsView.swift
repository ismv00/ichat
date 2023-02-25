//
//  ContactsView.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 25/02/23.
//

import SwiftUI

struct ContactsView: View {
    @StateObject var viewModel = ContactsViewModel()
    
    var body: some View {
        VStack {
            //MARK: UMA LISTA PRECISA SEMPRE TER UM IDENTIFICADOR POIS NÃO PODE SE REPETIR
            List(viewModel.contacts, id: \.self) { contact in
                ContactRow(contact: contact)
                
            }
        }.onAppear {
            viewModel.getContacts()
        }
    }
}

//MARK: CRIANDO AS LINHAS DA LISTA COM IMAGEM E NOME
struct ContactRow: View {
    
    var contact: Contacts
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: contact.profileUrl)){ image in
                image.resizable()
                    .scaledToFit()
            }
            placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            Text(contact.name)
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
