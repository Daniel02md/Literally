//
//  Movie.swift
//  Literally
//
//  Created by Marcos Bezerra on 16/06/23.
//

import SwiftUI

struct MovieCatalog: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var recents: FetchedResults<RecentMovie>
    
    @Binding var popular: [Movie]
    @Binding var topRated: [Movie]
    @State var actor: String  = String()
    
    let actors = [
        "Leonardo DiCaprio",
        "Meryl Streep",
        "Tom Hanks",
        "Jennifer Lawrence",
        "Brad Pitt",
        "Angelina Jolie",
        "Robert Downey Jr.",
        "Julia Roberts",
        "Johnny Depp",
        "Scarlett Johansson"
    ]
    
    var body: some View {
        
        ScrollView{
            VStack{
                Section(header:
                            Text("Melhores de todos os tempos")
                    .font(.system(.title2))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(topRated, id: \.movieId){resultMovies in
                                let img: URL = URL(string: "\(resultMovies.coverImageURL)")!
                                NavigationLink(destination:
                                                MovieView(imageUrl: img, title: resultMovies.title, rate: resultMovies.rate, description: resultMovies.description)
                                    .onAppear{
                                        let data = DataController()
                                        data.addRecentMovie(resultMovies, context: managedObjectContext)
                                    }
                                ){
                                    ItemCatalog(imageUrl: resultMovies.coverImageURL, title: resultMovies.title, author: resultMovies.authors[0])
                                        .padding(.leading, 20)
                                }
                            }
                            .frame(height: 250)
                        }
                    }
                    Spacer()
                    Section(header:
                                Text("Em alta")
                        .font(.system(.title2))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                    ){
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(popular, id: \.movieId){resultMovies in
                                    let img: URL = URL(string: "\(resultMovies.coverImageURL)")!
                                    NavigationLink(destination:
                                                    MovieView(imageUrl: img, title: resultMovies.title, rate: resultMovies.rate, description: resultMovies.description)
                                        .onAppear{
                                            let data = DataController()
                                            data.addRecentMovie(resultMovies, context: managedObjectContext)
                                        }
                                    ){
                                        ItemCatalog(imageUrl: resultMovies.coverImageURL, title: resultMovies.title, author: resultMovies.authors[0])
                                            .padding(.leading, 20)
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
                                        let img: URL = URL(string: recent.movie!.coverImageURL!)!
                                        
                                        NavigationLink(destination: {
                                            MovieView(imageUrl: img, title: recent.movie!.title ?? "Sem título", rate: 0.0, description: recent.movie!.fullDescription ?? "Sem descricao")
                                        }){
                                            ItemCatalog(
                                                imageUrl: recent.movie!.coverImageURL!,
                                                title: recent.movie!.title!,
                                                author: recent.movie!.authors!
                                            )
                                            .padding(.leading, 20)
                                            
                                        }
                                    }
                                }
                                .frame(height: 250)
                            }
                            
                        }
                        
                    }
                    
                }
            }
        }
    }
}
//    struct MovieCatalog_Previews: PreviewProvider {
//        static var previews: some View {
//            MovieCatalog()
//        }
//    }
//}
