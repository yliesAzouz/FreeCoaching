//
//  Coachlisting.swift
//  FREECOACHING
//
//  Created by diallo on 15/09/2021.


import SwiftUI



struct Coachlisting: View {
    
    let coachInfos = [
        FreeCoachingVar(coachImage: "tommy", coachName: "Tommy", coachcity: "Marseille", coachHeart: 4),
        FreeCoachingVar(coachImage: "isis", coachName: "Isis", coachcity: "Marseille", coachHeart: 3),
        FreeCoachingVar(coachImage: "johnny", coachName: "Johnny", coachcity: "Marseille", coachHeart: 4),
        FreeCoachingVar(coachImage: "ylies", coachName: "Ylies", coachcity: "Marseille", coachHeart: 3),
        FreeCoachingVar(coachImage: "jane", coachName: "Jane", coachcity: "Marseille", coachHeart: 4),
    ]
    
    @State var searchCity = ""
    @State var searching = false
    
    
    @State private var selectedChoice = "List"
    let choice = ["List", "Map"]
    
    
    var filteredCoachs: [FreeCoachingVar] {
        coachInfos.filter({ theCity in
            return theCity.coachcity.lowercased().contains(searchCity.lowercased()) || searchCity == ""
        })
    }
    
    
    //    @State var selection:Int = 0
    //    @State var mapCoach = false
    //
    //
    //    @State var selection:Int = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                //                Spacer(minLength: 20)
                
                
                //                Picker(selection:$selection, label:Text("")){
                //                    Text("Map").tag(0)
                //                    Text("List").tag(1)
                //                        .pickerStyle(SegmentedPickerStyle())
                //                        .padding(.horizontal, 24)
                //                }
                //
                //                if (selection == 0){
                //                                CoachDetailsView()
                //                            }else if(selection == 1){
                //                               EmptyView()
                
                Spacer()
                Picker("", selection: $selectedChoice) {
                    ForEach(choice, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                
                if selectedChoice == "Map" {
                    MapView()
                } else {
                    SearchBar(searchText: $searchCity, searching: $searching)
                                        .foregroundColor(.gray)
                                        .padding(.leading, 13)

                    List {
                        ForEach(filteredCoachs) { city
                            in
                            NavigationLink(destination: CoachProfil()) {
                                HStack {
                                    Image(city.coachImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                        .cornerRadius(20)
                                    
                                    VStack (alignment: .leading){
                                        
                                       
                                            Text(city.coachName)
                                                .font(.headline).bold()
                                       
                                        Spacer()
                                        HStack {
                                            ForEach(0..<5) { heart in
                                                Image(systemName: heart < city.coachHeart ? "heart.fill" : "heart")
                                            }
                                            .frame(width: 10, height: 10)
                                        }
                                         
                                        
                                    Spacer()
                                    Text(city.coachcity).font(.system(size: (15)))
                                        .foregroundColor(.gray)
                                        .font(.headline).italic()
                                        Spacer()
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                }
                
            }
            .gesture(DragGesture()
                        .onChanged({ _ in
                            UIApplication.shared.dismissKeyboard()
                        })
            )
            .listStyle(GroupedListStyle())
            .foregroundColor(.orange)
            .navigationTitle(searching ? "Searching city..." : "Coachs")
            .navigationBarTitleDisplayMode(.inline)
            
            
            .toolbar {
                if searching {
                    Button("Cancel") {
                        searchCity = ""
                        withAnimation {
                            searching = false
                            UIApplication.shared
                                .dismissKeyboard()
                        }
                    }
                }
            }
        }
    }
}

//                    List (coachInfos){coachInfo in
//                        coachLIstvariables(coachInfo: coachInfo)
//.navigationBarTitle("Contacts")
//    .navigationBarTitleDisplayMode(.inline)



//                        List {
//                      ForEach(coachInfos.filter{$0.hasPrefix(searchCity.lowercased()) || searchCity.lowercased() == ""}), id:\.self) {
//                        searchCity in Text(searchCity)
//                    }
//                }

extension UIApplication {
    func dismissKeyboard(){
        sendAction(#selector(UIResponder
                    .resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Coachlisting_Previews: PreviewProvider {
    static var previews: some View {
        Coachlisting()
    }
}

//                    Text("Searching for \(searchCity)")
//                        .searchable(text:$searchCity)
//                        .navigationTitle("Searchable Example")
