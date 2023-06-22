//
//  Movie.swift
//  Literally
//
//  Created by Marcos Bezerra on 16/06/23.
//

import SwiftUI

struct MovieCatalog: View {
    var body: some View {
        
        ScrollView{
            VStack{
                Section(header:
                            Text("Em alta")
                    .font(.system(.title2))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(1..<5){each in
                                NavigationLink(destination: Text(String(each))){
                                    ItemCatalog(imageUrl: "https://books.google.com/books/content?id=Zv3LygAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", title: "John Wickasdfadf", author: "Chad Staheiski")
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .frame(height: 250)
                    }
                }
                Spacer()
                Section(header:
                            Text("Recomendações")
                    .font(.system(.title2))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(1..<5){each in
                                NavigationLink(destination: Text(String(each))){
                                    ItemCatalog(imageUrl: "https://books.google.com/books/content?id=Zv3LygAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", title: "John Wick", author: "Chad Staheiski")
                                        .padding(.leading, 20)
                                }
                            }
                        }
                        .frame(height: 250)
                    }
                    
                }
                
                Section(header:
                            Text("Gêneros")
                    .bold()
                    .font(.system(.title2))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                ){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(1..<5){each in
                                NavigationLink(destination: Text(String(each))){
                                    ItemCatalog(imageUrl: "https://books.google.com/books/content?id=Zv3LygAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", title: "Tudo em todo lugar", author: "Chad Staheiski")
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

struct MovieCatalog_Previews: PreviewProvider {
    static var previews: some View {
        MovieCatalog()
    }
}
