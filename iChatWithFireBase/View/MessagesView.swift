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
                Text("Ola mundo")
            }
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

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
