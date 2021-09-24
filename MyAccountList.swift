//
//  MyAccountList.swift
//  FREECOACHING
//
//  Created by azouz on 15/09/2021.
//

import SwiftUI

struct MyAccountList: View {
    
    var myAccount: MyAccountID
    
    var body: some View {
        HStack {
            Text(myAccount.userInfo)
                .foregroundColor(.orange)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            Text(myAccount.userValue)
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
        }
    }
}

//struct MyAccountList_Previews: PreviewProvider {
//    static var previews: some View {
//        MyAccountList(myAccount: <#MyAccountID#>)
//    }
//}
