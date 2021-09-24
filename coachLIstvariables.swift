//
//  coachLIstvariables.swift
//  FREECOACHING
//
//  Created by diallo on 16/09/2021.
//

import SwiftUI

struct coachLIstvariables: View {
    
    var coachInfo: FreeCoachingVar
    
    var body: some View {
        
        HStack {
            Image (coachInfo.coachImage) 
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .cornerRadius(20)
            VStack {
                Text (coachInfo.coachName)
                Text (coachInfo.coachcity)
                
            }
        }
    }
}
//
//struct coachLIstvariables_Previews: PreviewProvider {
//    static var previews: some View {
//        coachLIstvariables(coachInfos: <#FreeCoachingVar#>)
//    }
//}
