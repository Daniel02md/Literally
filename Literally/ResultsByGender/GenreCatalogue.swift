//
//  genreCatalogue.swift
//  Literally
//
//  Created by user on 19/06/23.
//

import SwiftUI

struct GenreCatalogue: View {
    var body: some View {
        NavigationStack{
            
            VStack(alignment: .center){
                Text("Drama")
                    .font(.system(size: 32))
                    .fontWeight(.black)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: headerFavoriteView()) {
                        Image("baseViewGenre")
                    }
                }
            }
        }
    }
}

struct GenreCatalogue_Previews: PreviewProvider {
    static var previews: some View {
        GenreCatalogue()
    }
}
