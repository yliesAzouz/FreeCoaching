//
//  HeartRow.swift
//  FREECOACHING
//
//  Created by azouz on 20/09/2021.
//

import SwiftUI

struct HeartRow: View {
    
        var color: Color
        var icon: String

        var body: some View {

            HStack{

                Image(systemName: icon)
                    .foregroundColor(color)

            }.font(.system(size: 30))

        }
}

struct HeartRow_Previews: PreviewProvider {
    static var previews: some View {
        HeartRow(color: .red, icon: "heart")
    }
}
