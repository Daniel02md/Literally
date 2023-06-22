//
//  baseSearchView.swift
//  Literally
//
//  Created by user on 15/06/23.
//

import SwiftUI

struct baseSearchView: View {
    
    var movies = ["Jojo Rabbit", "Jonh Wick"]
    var books = ["É assim que acaba", "Estilhaca-me"]
    enum ChoiceScope {
        case movie
        case book
    }
    
    @State var scope: ChoiceScope = .book
    @State private var searchText = ""
    
    var filteredMovies: [String] {
        if searchText.isEmpty {
            return movies
        }
        else {
            return movies.filter { $0.contains(searchText) }
        }
    }
    
    var filteredBooks: [String] {
        if searchText.isEmpty {
            return books
        } else {
            return books.filter { $0.contains(searchText) }
        }
    }
    
    func choice () -> Array<String> {
        if scope == .book{
            return filteredBooks
        }else{
            return filteredMovies
        }
    }
    
    var body: some View {
        NavigationStack {
            
            List{
                
                NavigationLink {
                    Text("name")
                } label: {
                    Text("name")
                }
            }
            
            
        }
        .searchScopes($scope) {
            Text("Filme").tag(ChoiceScope.movie)
            Text("Livro").tag(ChoiceScope.book)
        }
        .searchable(text: $searchText)
        
        
        
       
        
        
    }
    
}

struct baseSearchView_Previews: PreviewProvider {
    static var previews: some View {
        baseSearchView()
    }
}
