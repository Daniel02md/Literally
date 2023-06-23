//
//  ItemCatalog.swift
//  Literally
//
//  Created by Marcos Bezerra on 17/06/23.
//

import SwiftUI

struct ItemCatalog: View {
    @State var imageUrl: String
    var title: String
    var author: String

    var body: some View {
        ZStack{
            VStack{
                Spacer()
                    .frame(height: 40)
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            VStack{
                Spacer()
                    
                VStack{
                    Text(title)
                        .lineLimit(2)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .padding(.leading, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(author)
                        .lineLimit(1)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .padding(.leading, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical)
            }
            .frame(width: 130)
            VStack{
                AsyncImage(url: URL(string: imageUrl)!) { phase in
                    switch(phase){
                    case .empty:
                        ProgressView()
                    case .success (let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 115, height: 160)
                            .cornerRadius(15)
                        
                            
                    case .failure(let error):
                        Text("failed to load: \(error.localizedDescription)")
                    @unknown default:
                        ProgressView()
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
                
            
        }
        .frame(width: 143, height: 235)
    }
}

struct ItemCatalog_Previews: PreviewProvider {
    static var previews: some View {
        ItemCatalog(imageUrl: "https://books.google.com/books/content?id=Zv3LygAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", title: "John Wick", author: "Chad Stad")
    }
}
