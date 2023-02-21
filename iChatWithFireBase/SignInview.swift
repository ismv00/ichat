//
//  ContentView.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 21/02/23.
//

import SwiftUI

struct SignInView: View {
    
    //MARK: ESTANCIANDO MINHA CLASS VIEWMODEL
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            
            //MARK: LOGO
            Image("chat_logo")
                .resizable()
                .scaledToFit()
                .padding()
            
            //MARK: INPUT TEXTS
            TextField("Entre com seu e-mail", text: $viewModel.email)
                .padding()
                .border(Color(UIColor.separator))
            
            SecureField("Entre com sua senha", text: $viewModel.password)
                .padding()
                .border(Color(uiColor: .separator))
            
            //MARK: BUTTONS
            Button {
                viewModel.signIn()
            } label: {
                Text("Entrar")
            }
            Divider()
            
            
            Button {
                print("Clicado 2")
            } label: {
                Text("Não tem uma conta? Clique aqui")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
