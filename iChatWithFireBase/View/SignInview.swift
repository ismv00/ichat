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
        NavigationView {
            VStack {
                //MARK: LOGO
                Image("chat_logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                //MARK: INPUT TEXTS
                TextField("Entre com seu e-mail", text: $viewModel.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom, 20)
                
                
                SecureField("Entre com sua senha", text: $viewModel.password)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom, 30)
                
                
                //MARK: BUTTONS
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
                Button {
                    viewModel.signIn()
                } label: {
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                }
                .alert(isPresented: $viewModel.formInvalid) {
                    Alert(title: Text(viewModel.alertText))
                }
                Divider()
                    .padding()
                
                NavigationLink(destination: SignUpView()) {
                    Text("Não tem uma conta? Clique aqui")
                        .foregroundColor(Color.black)
                }
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.init(red: 240 / 255, green: 231 / 255, blue: 210 / 255))
            .navigationTitle("Login")
            .navigationBarHidden(true) // Esconder o login na tela principal
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
