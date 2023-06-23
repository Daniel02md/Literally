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
    
    @Binding var byAuthors: [Book]
    @Binding var author: String

    var body: some View {
        ScrollView{
            VStack{
                Section(header:
                            Text("Autor do dia: \(self.author)")
                    .font(.system(.title2))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(byAuthors, id: \.self){resultBooks in
                                let img: URL = URL(string: resultBooks.coverImageURL)!
                                NavigationLink(destination:
                                                BookView(imageUrl: img, title: resultBooks.title, rate: resultBooks.rate, description: resultBooks.description)
                                    .onAppear{
                                        let data = DataController()
                                        data.addRecentBook(resultBooks, context: managedObjectContext)
                                    }
                                ){
                                    ItemCatalog(imageUrl: resultBooks.coverImageURL, title: resultBooks.title, author: resultBooks.authors[0])
                                        .padding(.leading, 20)
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
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(recents){recent in
                                let img: URL = URL(string: recent.book!.coverImageURL!)!
                                
                                NavigationLink(destination: {
                                    MovieView(imageUrl: img, title: recent.book!.title ?? "Sem título", rate: 0.0, description: recent.book!.fullDescription ?? "Sem descricao")
                                }){
                                    ItemCatalog(
                                        imageUrl: recent.book!.coverImageURL!,
                                        title: recent.book!.title!,
                                        author: recent.book!.authors!
                                    )
                                    .padding(.leading, 20)
                                    .onAppear{
                                        print(recent.book!.coverImageURL)
                                    }
                                }
                            }
                        }
                        .frame(height: 250)
                    }
                    
                }
                Spacer()
                
            }
        }
        
    }
}


