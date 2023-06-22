//
//  book.swift
//  Literally
//
//  Created by user on 21/06/23.
//

import Foundation


struct item: Hashable{
    var movieID: UUID = UUID()
    var imageUrl: String
    var title: String
    var creator: String
    var rate: Float
    var sumary: String
}
