//
//  book.swift
//  Literally
//
//  Created by user on 21/06/23.
//

import Foundation


struct movie: Hashable{
    var movieID: UUID = UUID()
    var imageUrl: String
    var title: String
    var creator: String
    var rate: Float
    var sumary: String
}
