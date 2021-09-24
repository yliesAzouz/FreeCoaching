
//  ChatHelper.swift
//  FreeCoaching
//
//  Created by daoud on 15/09/2021.


import Combine

class ChatHelper : ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages = DataSource.messages

    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
        self.objectWillChange.send()
    }
}
