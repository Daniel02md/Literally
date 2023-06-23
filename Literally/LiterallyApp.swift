//
//  LiterallyApp.swift
//  Literally
//
//  Created by Marcos Bezerra on 20/05/23.
//

import SwiftUI

@main
struct LiterallyApp: App {
    @AppStorage("isNew") var isNew = true
    @StateObject private var dataController = DataController()
    
    let availableAuthors = [
        "J.K. Rowling",
        "George R.R. Martin",
        "Stephen King",
        "Michelle Obama",
        "Dan Brown",
        "Gillian Flynn",
        "Haruki Murakami",
        "Jojo Moyes",
        "Celeste Ng",
        "Chimamanda Ngozi Adichie"
    ]
    @State var bookAuthor: String = ""
    @State var booksByAuthor: [Book] = []
    @State var topRated: [Movie] = []
    @State var popular: [Movie] = []

    var body: some Scene {
        WindowGroup{
            if isNew{
                ContentView(isNew: $isNew)
            }
            else{
                HomePageView(bookAuthor: self.$bookAuthor, booksByAuthor: self.$booksByAuthor, topRated: self.$topRated, popular: self.$popular)
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .onAppear{
                        MoviesAPI().popular{
                            movies in
                            if let movies = movies{
                                self.popular = movies
                            }
                        }
                        
                        MoviesAPI().topRated{
                            movies in
                            if let movies = movies{
                                self.topRated = movies
                            }
                        }
                        
                        self.bookAuthor = self.availableAuthors.randomElement()!
                        BooksAPI.recomendationByAuthor(author: self.bookAuthor){
                            books in
                            if let books = books{
                                self.booksByAuthor = books
                            }
                        }
                    }
            }
        }
        
    }
}
