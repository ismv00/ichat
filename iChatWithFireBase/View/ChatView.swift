//
//  ChatView.swift
//  iChatWithFireBase
//
//  Created by Igor S. Menezes on 25/02/23.
//

import SwiftUI

struct ChatView: View {
    
    let contact: Contacts
    @StateObject var viewModel = ChatViewModel()
    
    @State var textSize: CGSize = .zero
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.messages, id: \.self) { message in
                    MessageRow(message: message)
                }
            }
            Spacer()
            
            HStack {
                ZStack {
                    TextEditor(text: $viewModel.text)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(24.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24.0)
                                .strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0))
                        )
                        .frame(maxHeight: (textSize.height + 50) > 100 ? 100: textSize.height + 50)
                    
                    Text(viewModel.text)
                        .opacity(0.2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(ViewGeometry())
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 21)
                        .onPreferenceChange(ViewSizeKey.self) { size in
                            print("text size is \(size)")
                            textSize = size
                        }
                }
                Button {
                    viewModel.sendMessage(contact: contact)
                } label: {
                    Text("Enviar")
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                }
                .disabled(viewModel.text.isEmpty)
            }.padding(.vertical, 10)
                .padding(.horizontal, 16)
            
        }
        .navigationTitle(contact.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.onAppear(contact: contact)
        }
    }
}
struct ViewGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewSizeKey.self, value: geometry.size)
        }
    }
}

struct ViewSizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
     print("new value is  \(value)")
        value = nextValue()
    }
}

struct MessageRow : View {
    
    let message: Message
    
    var body: some View {
        Text(message.text)
            .background(Color(white: 0.95))
            .frame(maxWidth: .infinity, alignment: message.isMe ? .leading : .trailing)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.leading, message.isMe ? 0 : 50)
            .padding(.trailing, message.isMe ? 50 : 0)
            .padding(.vertical, 5)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(contact: Contacts(uuid: UUID().uuidString, name: "Ola mundo", profileUrl: ""))
    }
}
