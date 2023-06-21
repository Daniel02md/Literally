//
//  BooksAPI.swift
//  Literally
//
//  Created by Marcos Bezerra on 18/06/23.
//

import Foundation



struct BooksAPI{
    static private let API_KEY: String = "&key=AIzaSyCNzDhAKDOzWC6rgkBbpqW7n1qd68b1qHE"
    static private var BaseURL: String = "https://www.googleapis.com/books/v1/volumes"
    
    
    
    static func recomendationByAuthor(author: String, completion: @escaping ([Book]?) -> Void){
        request(queryStrings: ["q": "inauthor:\(author)"]){
            books in
             completion(books)
        }
    }
    static func search(query: String, completion: @escaping ([Book]?) -> Void){
        request(queryStrings: ["q" : query, "printType": "books"]){
            books in
             completion(books)
        }
        
    }
    
    static private func request(path: String? = nil, queryStrings: [String: String]? = nil, completion: @escaping ([Book]?) -> Void ){
        
        if let path = path{
            BaseURL += path
        }
        
        if let queryStrings = queryStrings{
                        var params: String = "?"
            var index: Int = 0
            
            for (key, value) in queryStrings{
                index += 1
                params += "\(key)=\(value)"
                
                if !(index >= queryStrings.count){
                    params += "&"
                }
            }
            

            self.BaseURL += params.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        let url = URL(string: self.BaseURL+API_KEY)
        
        let request = URLSession.shared.dataTask(with: url!){
            (data, resp, erro) in
            
            if let data = data{
                    
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let items = json["items"] as? [[String: Any]] {
                        
                        var books: [Book] = []
                        for item in items {
                            
                           
                            
                            
                            let bookId = item["id"] as? String
                            if let volumeInfo = item["volumeInfo"] as? [String: Any],
                               let title = volumeInfo["title"] as? String,
                               let authors = volumeInfo["authors"] as? [String],
                               let imageLinks = volumeInfo["imageLinks"] as? [String: String],
                               let coverImageURLString = imageLinks["thumbnail"],
                               let description = volumeInfo["description"] as? String {
                                var str = coverImageURLString
                                let ch :Character = "s"
                                let index = str.index(str.startIndex, offsetBy: 4)
                                str.insert(ch, at: index)
                                
                                let book = Book(bookId: bookId!, title: title, authors: authors, description: description, coverImageURL: str)
                                books.append(book)
                            }
                        }
                        
                        completion(books)
                        
                    } else {
                        print("No books found.")
                        completion(nil)
                    }
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
        request.resume()
    }
}
