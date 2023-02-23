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
        Button {
            viewModel.logout()
        } label: {
            Text("Logout")
        }

    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
