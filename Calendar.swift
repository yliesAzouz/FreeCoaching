//
//  Calendar.swift
//  FreeCoaching
//
//  Created by daoud on 16/09/2021.
//

import SwiftUI

struct Calendar: View {
    @State var selectedDate = Date()
    @State var meetConfirm: Bool = false
  var body: some View {
    VStack {
        Spacer()
    DatePicker("Select date", selection: $selectedDate)
        .datePickerStyle(GraphicalDatePickerStyle())
        .accentColor(.orange)
        
        Spacer()
        Button ("Confirm") {
            meetConfirm.toggle()
        }
        . font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        Spacer()
        
        Group {
            if meetConfirm {
                Text("Your RDV with Tommy the Tuesday 28th september 2021 at 12:00 AM is confirmed")
                  
            } else {
                Text(" ")
            }
        }
        Spacer()
    }
  }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar( )
    }
}
