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
    
    @State var byActors: [Movie] = []
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
                            Text("Personalidade do dia: \(self.actor)")
                    .font(.system(.title2))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(byActors, id: \.self){resultMovies in
                                NavigationLink(destination:
                                                Text(resultMovies.title)
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
                            HStack{
                                ForEach(recents){recent in
                                    NavigationLink(destination: Text("")){
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
        .onAppear{
            self.byActors = [Movie(movieId: "222", title: "Jojo Rabbit", authors:["Taika Waititi"], description: "Alemanha, durante a Segunda Guerra Mundial. Jojo (Roman Griffin Davis) é um jovem nazista de 10 anos, que trata Adolf Hitler (Taika Waititi) como um amigo próximo, em sua imaginação. Seu maior sonho é participar da Juventude Hitlerista, um grupo pró-nazista composto por outras pessoas que concordam com os seus ideais. Um dia, Jojo descobre que sua mãe (Scarlett Johansson) está escondendo uma judia (Thomasin McKenzie) no sótão de casa. Depois de várias tentativas frustradas para expulsá-la, o jovem rebelde começa a desenvolver empatia pela nova hóspede", coverImageURL: "https://br.web.img2.acsta.net/c_310_420/pictures/20/01/28/22/54/2304385.jpg")]//resultado da api
        }
    }
    
    struct MovieCatalog_Previews: PreviewProvider {
        static var previews: some View {
            MovieCatalog()
        }
    }
}
