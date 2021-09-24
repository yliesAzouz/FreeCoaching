//
//  ViewExtension.swift
//  FreeCoaching
//
//  Created by daoud on 15/09/2021.
//

import SwiftUI

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}
