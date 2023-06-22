//
//  CatalogueItensGenre.swift
//  Literally
//
//  Created by user on 19/06/23.
//

import SwiftUI

struct ItemListView: View {
    var imageUrl: URL
    var title: String
    var author: String
    var rate: Float
    
    var body: some View {
        HStack(spacing: 25){
            Spacer()
            VStack(alignment: .leading){
                Spacer()
                AsyncImage(url: self.imageUrl, content: { phase in
                    switch(phase){
                    case .empty:
                        Spacer()
                        ProgressView()
                            .frame(width: 119, height: 169)
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
                            .frame(width: 119, height: 169)
                    case .failure(let error):
                        Spacer()
                        ProgressView()
                            .frame(width: 119, height: 169)
                        Spacer()
                    default:
                        EmptyView()
                    }
                })
                
            }
            GeometryReader{ geometry in
                VStack(alignment: .leading){
                    Spacer()
                    Text("\(self.title)")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                        .fontWeight(.heavy)
                    
                    Text("\(self.author)")
                        .font(.system(size: 14))
                        .fontWeight(.light)
                    
                    HStack{
                        ForEach(1 ..< Int(self.rate + 1)) { item in
                            Image("star")
                        }
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width/1.6, alignment: .leading)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        
        
    }
}
        


struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        let img: URL = URL(string: "https://m.media-amazon.com/images/I/81-P6oEm8cL._AC_UF1000,1000_QL80_.jpg")!
        
        ItemListView(
            imageUrl: img, title: "Como eu era antes de voce", author: "Jojo moye", rate: 3.6
        )
    }
}
