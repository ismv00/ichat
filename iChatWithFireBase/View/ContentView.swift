//
//  ContentView.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 22/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLogged {
                MessagesView()
            } else {
                SignInView()
            }
        }.onAppear {
            viewModel.onAppear()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
