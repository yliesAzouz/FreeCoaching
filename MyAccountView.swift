//
//  MyAccountView.swift
//  FREECOACHING
//
//  Created by azouz on 15/09/2021.
//

import SwiftUI


struct MyAccountView: View {
    let myAccounts = [
        MyAccountID(userInfo: "Pseudo", userValue: "Stephane"),
        MyAccountID(userInfo: "Age", userValue: "24 years"),
        MyAccountID(userInfo: "Location", userValue: "Marseille"),
        MyAccountID(userInfo: "Sport", userValue: "Workout/Cycling"),
        MyAccountID(userInfo: "Objective", userValue: "Muscle Gain"),
        MyAccountID(userInfo: "Size", userValue: "185 cm"),
        MyAccountID(userInfo: "Weight", userValue: "86 kg")
        
    ]
    
    var body: some View {
        
        let images = ["steph1", "steph3","steph2"]
        
        NavigationView {
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay(Rectangle()
                                .stroke(Color.orange, lineWidth: 10))
                                .shadow(radius: 7)
                                .cornerRadius(30)
                                .padding()
                        }
                    }
                    
                }
                Text("I like do 🎉 and play 🎮 ")
                    .foregroundColor(.gray)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                List (myAccounts) { myAccount in
                    MyAccountList(myAccount: myAccount)
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("My account")
            .toolbar{
                EditButton()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}
