//
//  SwiftUIView.swift
//  Literally
//
//  Created by Fernanda Holanda on 16/06/23.
//

import SwiftUI



struct BookView: View {
    var imageUrl: URL
    var title: String
    var rate: Float
    var description: String
    @State var recomendations: [Movie] = [
//        Movie(movieUrl: "https://m.media-amazon.com/images/I/91K-MrUTNOL._AC_UF1000,1000_QL80_.jpg", title: "A Culpa é das estrelas", creator: "Josh Boone", rate: 2.7, sumary: "Dois adolescentes com câncer, Hazel Grace e Gus, embarcam em uma jornada de amor e descoberta. Apesar dos obstáculos, eles encontram força e alegria um no outro, explorando a vida e a mortalidade de uma maneira única e inesquecível."),
//        Movie(imageUrl: "https://br.web.img3.acsta.net/medias/nmedia/18/91/05/16/20127313.jpg", title: "Para Sempre", creator: "Michael Sucsy", rate: 4.8, sumary: "Paige e Leo são um casal feliz até um acidente mudar tudo. Com a perda de sua memória, Paige não se lembra de Leo, e ele precisa reconquistar seu amor e reconstruir seu relacionamento. Uma história de luta, esperança e amor verdadeiro além das adversidades."),
//        Movie(imageUrl: "https://upload.wikimedia.org/wikipedia/pt/a/ad/One_Day_Poster.jpg", title: "Um dia", creator: "Lone Scherfig", rate: 4.2, sumary: "Emma e Dexter se encontram todo dia 15 de julho ao longo de vinte anos, testemunhando o desenvolvimento de suas vidas e relacionamento. Conforme eles enfrentam desafios e oportunidades, a amizade e o amor entre eles se tornam uma jornada emocional e reveladora.")
        
//        Movie(movieId: String, title: <#T##String#>, authors: [String], description: <#T##String#>, coverImageURL: <#T##String#>)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack{
                    Spacer()
                    Button (action: {
                        Image("fullfilledIcon")
                    },label: {
                        Image("icon")
                    })
                }
                .padding()
                
                VStack(alignment: .leading){
                    Text(self.title)
                        .padding(.init(top: 0, leading: 0, bottom: 70, trailing: 0))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .font(.system(size:32))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(red: 44 / 255, green: 24 / 255, blue: 16 / 255))
                        .frame(width: 282, height: 24)
                        .multilineTextAlignment(.center)
                }
                
            ScrollView {
                    VStack {
                        
                        VStack {
                            AsyncImage(url: self.imageUrl, content: { phase in
                                switch(phase){
                                case .empty:
                                    Spacer()
                                    ProgressView()
                                    Spacer()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .cornerRadius(15)
                                        .aspectRatio(contentMode: .fit)
                                        .padding(5)
                                        .background(Color(red: 0.86, green: 0.86, blue: 0.86))
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(radius: 2, x: 0, y: 2)
                                case .failure(let error):
                                    Spacer()
                                    ProgressView()
                                    Spacer()
                                default:
                                    EmptyView()
                                }
                            })
                            
                        } .frame(maxWidth: 178, maxHeight: 264)
                        
                        HStack (){
                            ForEach(1 ..< Int(self.rate + 1)) {item in
                                Image("star")
                            }
                        }
                        Spacer()
                        
                    } .frame(maxWidth: 178, maxHeight: 264)
                    
                    
                    
                    VStack (alignment: .leading){
                        
                        HStack {
                            Text("Resumo")
                                .padding(.init(top: 5, leading: 30, bottom: 5, trailing: 30))
                                .font(.system(size:18))
                                .fontWeight(.bold)
                    
                        }
                        
                        VStack() {
                            Text(self.description)
                                .padding(.init(top: 0, leading: 50, bottom: 0, trailing: 50))
                                .font(.system(size:18))
                        }
                        
                        VStack(){
                            HStack{
                                Text("Filmes relacionados a este livro")
                                    .padding(.init(top: 5, leading: 30, bottom: 5, trailing: 30))
                                    .font(.system(size:18))
                                    .fontWeight(.bold)
                            }
                            
                            VStack(){
                                ForEach(recomendations, id: \.self) { movie in
                                    let img: URL = URL(string: "\(movie.coverImageURL)")!

                                    
                                    NavigationLink(destination:{
                                        BookView(imageUrl: img, title: movie.title, rate: movie.rate, description: "\(movie.description)")
                                    }){
                                        ItemListView(imageUrl: img, title: "\(movie.title)", author: "\(movie.authors[0])", rate: movie.rate)
                                            
                                    }
                                    .foregroundColor(.black)
                                }
                            }.frame(maxWidth: .infinity)
                        }
                    }
                    
                }
                
            }
            
        }
    }
}
    
    struct BookView_Previews: PreviewProvider {
        static var previews: some View {
            let img: URL = URL(string: "https://m.media-amazon.com/images/I/81-P6oEm8cL._AC_UF1000,1000_QL80_.jpg")!
            
            BookView(imageUrl: img, title: "AAAAAA", rate: 1.3, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        }
    }

