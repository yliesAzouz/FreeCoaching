//
//  CoachProfilRow.swift
//  FreeCoaching
//
//  Created by to on 15/09/2021.
//

import SwiftUI

struct CoachProfilRow: View {
    
    var sport : Profil
 
    
    var body: some View {
        
        
            HStack {
                Text(sport.text)
                    .foregroundColor(.orange)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text(sport.info)
                    .foregroundColor(.gray)
                    
                    .multilineTextAlignment(.trailing)
                
            }

    }
}

struct CoachProfilRow_Previews: PreviewProvider {
    static var previews: some View {
        CoachProfilRow(sport: Profil(text: "zzz", info: "zzz"))
    }
}
