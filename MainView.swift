//
//  MainView.swift
//  FREECOACHING
//
//  Created by azouz on 20/09/2021.
//

import SwiftUI

struct MainView: View {
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .orange
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
       coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
     
        UINavigationBar.appearance().standardAppearance = coloredAppearance
//        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
            
    }
    
    var body: some View {
        TabView {
            Coachlisting()
                .tabItem {
                    Label("Contacts", systemImage : "list.bullet")
                    
                }
            HistoricChat()
                .tabItem {
                    Label("Chats", systemImage : "bubble.right")
                    
                }
            MyAccountView()
                .tabItem {
                    Label("My Account", systemImage : "person")
                    
                }
            
        }
        .accentColor(.orange)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ChatHelper())
    }
}

//.navigationBarTitle(Text("TOMMY"))
//.navigationBarTitleDisplayMode(.inline)
//.navigationBarItems(trailing:
//                       HStack {
//                           NavigationLink(destination: ChatTommy()) {
//           Image(systemName: "calendar.badge.plus")
//               .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                           }
//
//                           NavigationLink(destination: ChatView()) {
//           Image(systemName: "plus.bubble")
//                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                            }
//                      })
