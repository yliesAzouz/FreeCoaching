//
//  CoachMessage.swift
//  FreeCoaching
//
//  Created by daoud on 15/09/2021.
//

import SwiftUI

struct Message: Identifiable, Hashable {
    var id = UUID()
    var content: String
    var user: User
}
struct DataSource {
    static let firstUser = User(name: "Tommy", avatar: "tommy")
    static var secondUser = User(name: "Stephane", avatar: "steph1", isCurrentUser: true)
    static let messages = [
        Message(content: "Hi Tommy, I saw your profile on this app and i like it, can we speak for a moment?", user: DataSource.secondUser),
        Message(content: "Hi Steph, Yes of course. What can i do for you?", user: DataSource.firstUser),
        Message(content: "I don't like sports and i have somme back problems as a result of my weight. My doctor said that i should start practicing a sport to loose some weight, could you help me?  ", user: DataSource.secondUser),
        Message(content: "Of course, let's start with some questions: if you have to choose a sport to start with, wich one would you choose? And what are your objective?", user: DataSource.firstUser)
    ]
}

struct User: Hashable {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}

struct ContentMessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(5)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}


struct DataSource_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "", isCurrentUser: false)
    }
}
