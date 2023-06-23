//
//  book.swift
//  Literally
//
//  Created by user on 21/06/23.
//

import Foundation


struct Movie: Hashable{
    var movieId: String
    var title: String
    var authors: [String]
    var description: String
    var coverImageURL: String
    var rate: Float = 0.0
}
