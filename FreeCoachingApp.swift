//
//  FreeCoachingApp.swift
//  FreeCoaching
//
//  Created by daoud on 15/09/2021.
//

import SwiftUI

@main
struct FreeCoachingApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ChatHelper())
        }
    }
}
