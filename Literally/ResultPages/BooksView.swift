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
    var author: String
    var rate: Float
    var sumario: String
    //    var recomandations: Array<Any>
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack{
                    Spacer()
                    Button {
                            
                    } label: {
                        Image("icon")

                    }
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
                            Text("Sumário")
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
                                Text("Filmes relacionados a este livro")
                                    .padding(.init(top: 5, leading: 30, bottom: 5, trailing: 30))
                                    .font(.system(size:16))
                                    .fontWeight(.bold)
                            }
                            
                            VStack{
    //                            NavigationLink()
    //                            NavigationLink()
    //                            NavigationLink()
                            }
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
            
            BookView(
                imageUrl: img, title: "Como eu era antes de você", author: "Jojo moye", rate: 5, sumario: "Em É assim que acaba, Colleen Hoover nos apresenta Lily, uma jovem que se mudou de uma cidadezinha do Maine para Boston, se formou em marketing e abriu a própria floricultura. E é em um dos terraços de Boston que ela conhece Ryle, um neurocirurgião confiante, teimoso e talvez até um pouco arrogante, com uma grande aversão a relacionamentos, mas que se sente muito atraído por ela.")
        }
    }

