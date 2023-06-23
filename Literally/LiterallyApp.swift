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
    
    var body: some Scene {
        WindowGroup{
            if isNew{
                ContentView(isNew: $isNew)
            }
            else{
                HomePageView(bookAuthor: self.$bookAuthor, booksByAuthor: self.$booksByAuthor)
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .onAppear{
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
