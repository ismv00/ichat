//
//  SignUpView.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 21/02/23.
//

import SwiftUI


struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    
    @State var isShowPhotoLibrary = false
    
    var body: some View {
        VStack {
            
            Button {
                isShowPhotoLibrary = true
            } label: {
                if viewModel.image.size.width > 0 {
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("GreenColor"),lineWidth: 4))
                        .shadow(radius: 7)
                } else {
                    Text("Foto")
                    .frame(width: 130, height: 130)
                    .padding()
                    .background(Color("GreenColor"))
                    .foregroundColor(Color.white)
                    .cornerRadius(100.0)
                }
                
            }
                .padding(.bottom, 32)
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(selectedImage: $viewModel.image)
                }

                
                TextField("Entre com seu nome", text: $viewModel.name)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom, 20)
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
                    viewModel.signUp()
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
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.init(red: 240 / 255, green: 231 / 255, blue: 210 / 255))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
