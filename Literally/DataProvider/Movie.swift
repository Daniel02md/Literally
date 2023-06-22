//
//  book.swift
//  Literally
//
//  Created by user on 21/06/23.
//

import Foundation


struct Movie: Hashable{
    let movieId: String
    let title: String
    let authors: [String]
    let description: String
    var coverImageURL: String
    var rate: Float = 0.0
}
