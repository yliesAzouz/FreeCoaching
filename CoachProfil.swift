//
//  CoachProfil.swift
//  FreeCoaching
//
//  Created by to on 15/09/2021.
//

import SwiftUI

struct CoachProfil: View {
    
    let coachProfils = [
        Profil(text: "Name", info: "Tommy"),
        Profil(text: "Age", info: "27"),
        Profil(text: "Location", info: "Marseille"),
        Profil(text: "Sport", info: "Boxe / Work Out"),
        Profil(text: "Speciality", info: "Weight loss / Bodybuilding"),
        Profil(text: "Hobbies", info: "⚽️ 👨‍💻 🏃‍♂️ 🏂 🚴"),
        
    ]
    
    var body: some View {
        
        let images = ["tommy","tommy1","tommy2","tommy3","tommy4","tommy5",]

            ZStack{
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    
                    //le scroll des photos de profile
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay(Rectangle()
                                .stroke(Color.orange, lineWidth: 10))
//                                .scaledToFit()
                                .cornerRadius(30)
                            }
                        } .padding()
                    }

                    //Phrase du coach
                    Text("Float like a 🦋, sting like a 🐝!")
                        
                        .fontWeight(.bold)
                        .frame(alignment: .trailing)
                        .font(.title2)
                        .foregroundColor(.gray)
                        
                    Spacer()
                    //Nombre de coeur plus le nombres de comment
                    HStack{
                        HeartRow(color: .orange, icon: "heart.fill")
                        HeartRow(color: .orange, icon: "heart.fill")
                        HeartRow(color: .orange, icon: "heart.fill")
                        HeartRow(color: .orange, icon: "heart.fill")
                        HeartRow(color: .orange, icon: "heart")
                        Text("(154)")
                            .foregroundColor(.orange)
                    }
                    //Info du coach
                    List {
                        ForEach(coachProfils) { sport in
                            CoachProfilRow(sport: sport)
                                .listRowBackground(Color(UIColor.white))
                        }
                    }
                    .listStyle(PlainListStyle())
                }
               .navigationBarTitle(Text("TOMMY"))
                .navigationBarTitleDisplayMode(.inline)
               .navigationBarItems(trailing:
                                     HStack {
                                         NavigationLink(destination: Calendar()) {
                         Image(systemName: "calendar.badge.plus")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                                          }

                                         NavigationLink(destination: ChatView()) {
                          Image(systemName: "plus.bubble")
                               .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                                          }
                                     })
               // .accentColor(.white)
            }
    }
}





struct CoachProfil_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoachProfil()
                .environmentObject(ChatHelper())
        }
    }
}
