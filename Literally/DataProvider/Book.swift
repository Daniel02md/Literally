//
//  BookDataProvider.swift
//  Literally
//
//  Created by Marcos Bezerra on 18/06/23.
//

import Foundation

struct Book: Hashable{
    var bookId: String
    var title: String
    var authors: [String]
    var description: String
    var coverImageURL: String
    var rate: Float = 0.0
}






