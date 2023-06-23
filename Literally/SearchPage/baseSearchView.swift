//
//  baseSearchView.swift
//  Literally
//
//  Created by user on 15/06/23.
//

import SwiftUI

struct baseSearchView: View {
    
    @Binding var scope: ChoiceScope
    @Binding var searchTerm: String
    @State var contentBook: [Book] = []
    @State var contentMovie: [Movie] = []
    
    var body: some View {
        NavigationLink(destination: {Text("")}) {
            
            scope == .book ? List($contentBook ,id: \.bookId){ item in
                Text(item.wrappedValue.description)} : List($contentMovie, id: \.movieId){ item in
                    Text(item.wrappedValue.title)}
        }
        .onAppear{
            scope = .movie
        }
        .onChange(of: scope) { newValue in
            if newValue == .book{
                BooksAPI.search(query: searchTerm){
                    books in
                    if let books = books {
                        self.contentBook = books
                    }
                }
            }else{
                MoviesAPI().search(query: searchTerm){
                    movies in
                    if let movies = movies {
                        self.contentMovie = movies
                    }
                }
            }
        }
    }
        
    
}

