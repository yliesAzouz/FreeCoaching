//
//  HistoricChatRow.swift
//  FREECOACHING
//
//  Created by azouz on 16/09/2021.
//

import SwiftUI

struct HistoricChatRow: View {
    
    var historicChat: HistoricChatID
    
    var body: some View {
        NavigationLink(destination: ChatView()) {
            HStack {
                Image(historicChat.coachImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame( maxWidth: 80, maxHeight: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 7)
                
                VStack (alignment: .leading) {
                    Text(historicChat.coachName)
                        .foregroundColor(.orange)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 3.0)
                    Text(historicChat.lastChat)
                        
                        .foregroundColor(.gray)
                        .italic()
                        .lineLimit(1)
                    
                }
                Spacer()
                Text(historicChat.timeChat)
                    .foregroundColor(.gray)
            }
            
        }
    }
}

struct HistoricChatRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoricChatRow(historicChat: HistoricChatID(coachImage: "tommy", coachName: "Tommy", lastChat: "Manges tes mort", timeChat: " 10:34"))
    }
}
