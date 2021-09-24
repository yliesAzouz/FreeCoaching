//
//  ChatView.swift
//  FreeCoaching
//
//  Created by daoud on 15/09/2021.
//

import SwiftUI

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        
            VStack {
                ScrollViewReader { reader in
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(chatHelper.realTimeMessages) { msg in
                            MessageView(currentMessage: msg)
                                .id(msg.id)
                        }
                        .onChange(of: chatHelper.realTimeMessages, perform: { value in
                            reader.scrollTo(chatHelper.realTimeMessages.last!.id)
                        })
                        
                    }
                }
                HStack {
                    TextField("Message...", text: $typingMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30))
                    Button(action: sendMessage) {
                        Text("Send")
                    }
                }.frame(minHeight: CGFloat(40)).padding()
            }
//            .navigationBarTitle(Text(DataSource.firstUser.name), displayMode: .inline)
//            .padding(.bottom, keyboard.currentHeight)
//            .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
        
        .onTapGesture {
            self.endEditing(true)
        }
        .environmentObject(ChatHelper())
    }
    
    func sendMessage() {
        chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
        typingMessage = ""
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ChatHelper())
        
    }
}
