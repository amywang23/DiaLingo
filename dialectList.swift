//
//  dialectList.swift
//  Dialingo
//

import Foundation

import SwiftUI

struct DialectListView: View {
    
    let langs = ["Arabic", "Bengali", "English", "Mandarin", "Spanish", "..."]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar() // Assuming you have a custom SearchBar view
                    .padding()
                /*
                 List {
                 Text("Arabic")
                 Text("Bengali")
                 Text("English")
                 Text("Mandarin")
                 Text("Spanish")
                 Text("...")
                 // Add more dialects as needed
                 }
                 .listStyle(InsetGroupedListStyle())
                 }
                 .navigationTitle("Mainstream language")
                 */
                
                List(langs, id: \.self) { dialect in
                    NavigationLink(destination: DialectDetailView(dialect: dialect)) {
                        Text(dialect)
                    }
                }.listStyle(InsetGroupedListStyle()).navigationTitle("Mainstream Language")
                
            }
        }
    }
    
    struct SearchBar: View {
        @State private var searchText = ""
        
        var body: some View {
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    struct DialectListView_Previews: PreviewProvider {
        static var previews: some View {
            DialectListView()
        }
    }
    
}
