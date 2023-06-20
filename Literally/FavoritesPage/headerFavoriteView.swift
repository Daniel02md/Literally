//
//  favoriteView.swift
//  Literally
//
//  Created by user on 19/06/23.
//

import SwiftUI

struct headerFavoriteView: View {
    var saves = ["aaaa", "bbbb"]
    var body: some View {
        NavigationStack{
            HStack{
                Text("Salvos")
                    .font(.system(size: 32))
                    .fontWeight(.black)
            }
            
            List{
                ForEach(saves, id: \.self) { name in
                    NavigationLink{
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
        }
    }
}

struct favoriteView_Previews: PreviewProvider {
    static var previews: some View {
        headerFavoriteView()
    }
}
