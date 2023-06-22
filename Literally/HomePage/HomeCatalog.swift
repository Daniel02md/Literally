//
//  Home.swift
//  Literally
//
//  Created by Marcos Bezerra on 16/06/23.
//

import SwiftUI

struct HomeCatalog: View {
    enum HomeScope{
        case movie
        case book
    }
    
    @State private var scope: HomeScope = .movie
    
    var body: some View {
        VStack(){
            HStack(alignment: .top){
                Button(action:{scope = .movie}){
                    VStack(spacing: 5){
                        Text("Filmes")
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(scope == .movie ? Color.orange : Color.gray)
                        Rectangle()
                            .frame(width: 50, height: 2)
                            .foregroundColor(scope == .movie ? Color.orange : Color.gray)
                    }
                }
                
                Spacer()
                Button(action:{scope = .book}){
                    VStack(spacing: 5){
                        Text("Livros")
                            .foregroundColor(scope == .book ? Color.orange : Color.gray)
                            .font(.system(size: 24, design: .rounded))
                            
                        Rectangle()
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5)
                            .frame(width: 50, height: 2)
                            .foregroundColor(scope == .book ? Color.orange : Color.gray)
                    }
                }
                
            }
            .frame(maxHeight:30)
            .padding(.horizontal, 50)
            Divider()
            
            if (scope == .movie){
                
                MovieCatalog()
            }
            else{
               
                BookCatalog()
            }
            
        }
        .padding(.top, 50)
    }
}


struct HomeCatalog_Previews: PreviewProvider {
    static var previews: some View {
        HomeCatalog()
    }
}
