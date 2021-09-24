//
//  HistoricChat.swift
//  FREECOACHING
//
//  Created by azouz on 16/09/2021.
//

import SwiftUI

struct HistoricChat: View {
    
    @EnvironmentObject var chatHelper: ChatHelper
    
    @State private var historicChats = [
        HistoricChatID(coachImage: "fatou", coachName: "Fatou", lastChat: "Have a nice day !", timeChat: "09:38"),
        HistoricChatID(coachImage: "ylies", coachName: "Ylies", lastChat: "👍", timeChat: "Yesterday"),
        HistoricChatID(coachImage: "johnny", coachName: "Johnny", lastChat: "How are u ? ", timeChat: "2 yrs ago"),
        HistoricChatID(coachImage: "chantal", coachName: "Chantal", lastChat: "You're the best", timeChat: "2 yrs ago"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                HistoricChatRow(historicChat: HistoricChatID(coachImage: "tommy", coachName: "Tommy", lastChat: chatHelper.realTimeMessages.last!.content, timeChat: "10:39"))
                
                ForEach(historicChats) { historicChat in
                    HistoricChatRow(historicChat: historicChat)
                        .listRowBackground(Color.white)
                        .listStyle(PlainListStyle())
                }
                
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Chats")
            .toolbar{
                EditButton()
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    func delete(at offsets: IndexSet) {
        historicChats.remove(atOffsets: offsets)
    }
//    func delete2(at offsets: IndexSet) {
//        HistoricChatRow.remove(atOffsets: offsets)
//    }
}

struct HistoricChat_Previews: PreviewProvider {
    static var previews: some View {
        HistoricChat()
            .environmentObject(ChatHelper())
    }
}
