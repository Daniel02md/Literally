//
//  BookDataProvider.swift
//  Literally
//
//  Created by Marcos Bezerra on 18/06/23.
//

import Foundation

struct Book: Hashable{
    let bookId: String
    let title: String
    let authors: [String]
    let description: String
    var coverImageURL: String
    var rate: Float = 0.0
}






