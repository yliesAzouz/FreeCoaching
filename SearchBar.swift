//
//  SearchBar.swift
//  FREECOACHING
//
//  Created by diallo on 17/09/2021.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText:String
    @Binding var searching:Bool
    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.2)
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("search...", text: $searchText){
                    startedSearching in
                    if startedSearching {
                        withAnimation {
                            searching = true
                        }
                    }
                }onCommit:{
                    withAnimation {
                        searching = false
                    }
                }
            }.foregroundColor(.gray)
            .padding()
            
        }
        .frame(height:40)
        .cornerRadius(13)
        .padding()
    }
}
        
        

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), searching: .constant(false))
    }
}
