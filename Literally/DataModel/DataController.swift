//
//  DataController.swift
//  Literally
//
//  Created by Marcos Bezerra on 20/06/23.
//

import Foundation
import CoreData


class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Literally")
    
    init(){
        container.loadPersistentStores{
            (desc, error) in
            if let error = error{
                print("Failed to load the database: \(error)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) -> Void{
        do{
            try context.save()
            print("save data.")
        }
        catch{
            print("Failed to save data.")
        }
    }
    
    func addRecentBook(_ bookData: Book, context: NSManagedObjectContext){
        let book = Book_DB(context: context)
        book.bookID = bookData.bookId
        book.title = bookData.title
        book.authors = bookData.authors[0]
        book.coverImageURL = bookData.coverImageURL
        book.fullDescription = bookData.description
        
        
        
        let recent = RecentBook(context: context)
        recent.date = Date()
        recent.book = book
        
        save(context: context)
    }
    
}
