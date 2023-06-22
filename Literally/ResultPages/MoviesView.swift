//
//  MoviesResultsView.swift
//  Literally
//
//  Created by Fernanda Holanda on 16/06/23.
//

import SwiftUI



struct MovieView: View {
    var imageUrl: URL
    var title: String
    var rate: Float
    var sumario: String
    @State var recomendations: [book] = [
        book(imageUrl: "https://books.google.com.br/books/publisher/content?id=Ez7NDwAAQBAJ&hl=pt-BR&pg=PP1&img=1&zoom=3&bul=1&sig=ACfU3U318iID-2tDrnAKFXK3fR8YtYITpw&w=1280", title: "O Céu que nos oprime", creator: "Josh Boone", rate: 4.8, sumary: "O livro que inspirou o filme Jojo Rabbit , do diretor Taika Waititi, vencedor do Oscar de Melhor Roteiro Adaptado; para fãs dos best-sellers A menina que roubava livros e O menino do pijama listrado. “Um desses livros impossíveis de esquecer.” - Le Monde Como muitos meninos austríacos na época da anexação da Áustria ao Reich alemão, no fim da década de 1930, Johannes Betzler abraça inocentemente o sonho nazista. Integrante da Juventude Hitlerista, ele descobre que seus pais estão escondendo uma jovem judia, Elsa Kor, atrás de uma parede falsa em sua casa, em Viena. Seu horror inicial vira interesse, depois amor e obsessão. Após o desaparecimento de seus pais, Johannes descobre que ele é a única pessoa ciente da existência de Elsa e único responsável por sua sobrevivência. Manipulando e sendo manipulado, Johannes teme o fim da guerra: com isso virá a perspectiva de perder Elsa e um relacionamento que varia entre paixão e obsessão, dependência e indiferença, amor e ódio."),
        book(imageUrl: "https://m.media-amazon.com/images/I/61L+4OBhm-L._AC_UF350,350_QL50_.jpg", title: "A Menina que Roubava Livros", creator: "Markus Zusak", rate: 3.5, sumary: "A trajetória de Liesel Meminger é contada por uma narradora mórbida, surpreendentemente simpática. Ao perceber que a pequena ladra de livros lhe escapa, a Morte afeiçoa-se à menina e rastreia suas pegadas de 1939 a 1943. Traços de uma sobrevivente: a mãe comunista, perseguida pelo nazismo, envia Liesel e o irmão para o subúrbio pobre de uma cidade alemã, onde um casal se dispõe a adotá-los por dinheiro. O garoto morre no trajeto e é enterrado por um coveiro que deixa cair um livro na neve. É o primeiro de uma série que a menina vai surrupiar ao longo dos anos. O único vínculo com a família é esta obra, que ela ainda não sabe ler. Assombrada por pesadelos, ela compensa o medo e a solidão das noites com a conivência do pai adotivo, um pintor de parede bonachão que lhe dá lições de leitura. Alfabetizada sob vistas grossas da madrasta, Liesel canaliza urgências para a literatura. Em tempos de livros incendiados, ela os furta, ou os lê na biblioteca do prefeito da cidade."),
        book(imageUrl: "https://i.zst.com.br/thumbs/12/1a/c/52392433.jpg", title: "O Menino do Pijama Listrado", creator: "John Boyne", rate: 4.2, sumary: "Bruno tem nove anos e não sabe nada sobre o Holocausto e a Solução Final contra os judeus. Também não faz idéia que seu país está em guerra com boa parte da Europa, e muito menos que sua família está envolvida no conflito. Na verdade, Bruno sabe apenas que foi obrigado a abandonar a espaçosa casa em que vivia em Berlim e a mudar-se para uma região desolada, onde ele não tem ninguém para brincar nem nada para fazer. Da janela do quarto, Bruno pode ver uma cerca, e para além dela centenas de pessoas de pijama, que sempre o deixam com frio na barriga. Em uma de suas andanças Bruno conhece Shmuel, um garoto do outro lado da cerca que curiosamente nasceu no mesmo dia que ele. Conforme a amizade dos dois se intensifica, Bruno vai aos poucos tentando elucidar o mistério que ronda as atividades de seu pai. ")
    ]
    
    @State var isButtonPressed: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack{
                    Spacer()
                    Button(action: {
                        isButtonPressed.toggle()
                    },  label: {
                        Image(isButtonPressed ? "fullfilledIcon" : "icon")
                        
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
                                .font(.system(size:16))
                                .fontWeight(.bold)
                            
                        }
                        
                        VStack(alignment: .leading) {
                            Text(self.sumario)
                                .padding(.init(top: 0, leading: 50, bottom: 0, trailing: 50))
                                .font(.system(size:16))
                        }
                        
                        VStack(){
                            HStack{
                                Text("Livros relacionados a este filme")
                                    .padding(.init(top: 5, leading: 30, bottom: 5, trailing: 30))
                                    .font(.system(size:16))
                                    .fontWeight(.bold)
                            }
                            
                            VStack(){
                                ForEach(recomendations, id: \.self) { book in
                                    let img: URL = URL(string: "\(book.imageUrl)")!

                                    
                                    NavigationLink(destination:{
                                        ItemListView(imageUrl: img, title: "\(book.title)", author: book.creator, rate: book.rate)
                                    }){
                                        ItemListView(imageUrl: img, title: "\(book.title)", author: "\(book.creator)", rate: book.rate)
          
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


    struct MoviesView_Previews: PreviewProvider {
        static var previews: some View {
            let img: URL = URL(string: "https://br.web.img3.acsta.net/pictures/20/01/28/22/54/2304385.jpg")!
            
            MovieView (
                imageUrl: img, title: "Jojo Rabbit", rate: 5, sumario: "Jojo é um garoto alemão solitário que descobre que sua mãe está escondendo uma garota judia no sótão. Ajudado apenas por seu amigo imaginário, Adolf Hitler, Jojo deve enfrentar seu nacionalismo cego enquanto a Segunda Guerra Mundial prossegue.")
           
        }
    }


