//
//  baseView.swift
//  Literally
//
//  Created by user on 16/06/23.
//

import SwiftUI


struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        let img: URL = URL(string: "https://m.media-amazon.com/images/I/81-P6oEm8cL._AC_UF1000,1000_QL80_.jpg")!

        ItemListView(
            imageUrl: img, title: "Como eu era antes de voce", author: "Jojo moye", rate: 3.6
        )
    }
}
