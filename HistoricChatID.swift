//
//  HistoricChatID.swift
//  FREECOACHING
//
//  Created by azouz on 16/09/2021.
//

import SwiftUI


struct HistoricChatID: Identifiable {
    
    var id = UUID()
    var coachImage: String
    var coachName: String
    var lastChat: String
    var timeChat: String
    
}

//struct HistoricChatID_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoricChatID(coachImage: "pic.steph", coachName: "Tommy", lastChat: "HI!", timeChat: "10:29")
//    }
//}
