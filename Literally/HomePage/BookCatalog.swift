//
//  BookHOme.swift
//  Literally
//
//  Created by Marcos Bezerra on 17/06/23.
//

import SwiftUI

struct BookCatalog: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var recents: FetchedResults<RecentBook>
    
    @State var byAuthors: [Book] = []
    @State var author: String  = String()
    let authors = [
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
    
    
    var body: some View {
        ScrollView{
            VStack{
                Section(header:
                            Text("Autor do dia: \(self.author)")
                    .font(.system(.title2))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(byAuthors, id: \.self){resultBooks in
                                NavigationLink(destination:
                                    Text(resultBooks.title)
                                    .onAppear{
                                        let data = DataController()
                                        data.addRecentBook(resultBooks, context: managedObjectContext)
                                    }
                                ){
                                    ItemCatalog(imageUrl: resultBooks.coverImageURL, title: resultBooks.title, author: resultBooks.authors[0])
                                        .padding(.leading, 30)
                                }
                            }
                        }
                        .frame(height: 250)
                    }
                    
                }
                Spacer()
                Section(header:
                            Text("Recentes")
                    .font(.system(.title2))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(recents){recent in
                                NavigationLink(destination: Text("")){
                                    ItemCatalog(
                                        imageUrl: recent.book!.coverImageURL!,
                                        title: recent.book!.title!,
                                        author: recent.book!.authors!
                                    )
                                }
                            }
                        }
                        .frame(height: 250)
                    }
                    
                }
                Spacer()
                   
            }
        }
        .onAppear{
            self.author = self.authors.randomElement()!
            BooksAPI.recomendationByAuthor(author: self.author){
                books in
                if let books = books{
                    self.byAuthors = books
                    
                }
            }
        }
        
    }
}

struct BookCatalog_Previews: PreviewProvider {
    static var previews: some View {
        BookCatalog()
    }
}
